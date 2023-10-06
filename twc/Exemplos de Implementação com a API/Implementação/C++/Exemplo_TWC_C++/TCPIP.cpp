

#include "TCPIP.h"
#include <ws2tcpip.h>
#include <winsock2.h>



#pragma comment (lib, "Ws2_32.lib")

//-----------------------------------------------------------------------------


bool isValidIpAddress(char *ipAddress)
{
	struct sockaddr_in sa;
	int result = inet_pton(AF_INET, ipAddress, &(sa.sin_addr));
	return result != 0;
}



//-----------------------------------------------------------------------------


TCP_COM::TCP_COM()
{
	this->Timeout.tv_sec  = 1 ;
	this->Timeout.tv_usec = 0 ;

	this->Port = 0 ;

	this->Addr = NULL;
	this->Client = NULL;


}


//-----------------------------------------------------------------------------


TCP_COM::TCP_COM(char * addr, int port , TIMEVAL timeout)
{

	this->Timeout.tv_sec  = timeout.tv_sec ;
	this->Timeout.tv_usec = timeout.tv_usec ;

	this->Port = port ;


	if(isValidIpAddress(addr))
		strcpy(this->Addr, addr) ;
	else
		this->Addr = NULL;

	this->Client = NULL;

}


//-----------------------------------------------------------------------------


bool TCP_COM::Connect()
{

	if (this->Addr == NULL || this->Port == 0 )		return false;

	ULONG NonBlk = 1;
	int Ret;
	DWORD Err;
	WSADATA wsaData;

	int iResult = WSAStartup(MAKEWORD(2,2), &wsaData);
	if (iResult != 0)	return false;

	// Open socket
	this->Client = socket(AF_INET, SOCK_STREAM, 0);

	// Set to Non-blocking mode
	ioctlsocket(this->Client, FIONBIO, &NonBlk);

	// Some address and port.
	SOCKADDR_IN  sin;
	DWORD             Addr;
	Addr = inet_addr(this->Addr);

	sin.sin_family            = AF_INET;
	sin.sin_port              = htons(this->Port);
	sin.sin_addr.s_addr       = Addr;

	// This call will return immediately, coz our socket is non-blocking
	Ret = connect(this->Client, (const sockaddr*)&sin, sizeof(sin));


	// If connected, it will return 0, or error
	 if (Ret == SOCKET_ERROR)
	 {
			Err = WSAGetLastError();
			// Check if the error was WSAEWOULDBLOCK, where we'll wait.
			if (Err == WSAEWOULDBLOCK)
		   {
				   fd_set       Write, Err;

				   FD_ZERO(&Write);
				   FD_ZERO(&Err);
				   FD_SET(this->Client, &Write);
				   FD_SET(this->Client, &Err);

				   Ret = select (0,                // ignored
									   NULL,           // read,
									   &Write,        // Write Check
									   &Err,            // Error check
									   &this->Timeout);

				   if (Ret == 0)	return false;
				   else
				   {
						  if (FD_ISSET(this->Client, &Write))
						  {
								   return true;

						  }
						  if (FD_ISSET(this->Client, &Err))
						  {

								  WSACleanup();
								  return false;

						  }
					}
			 }
			 else
			 {
				 WSACleanup();
				 return false;
			 }

	   }
	   else
	   {
			    WSACleanup();
				return true;

	   }

}


//-----------------------------------------------------------------------------


bool TCP_COM::Connect(char * addr , int port, TIMEVAL timeout)
{



	if(isValidIpAddress(addr))
	{
		if(this->Addr == NULL)		this->Addr = new char[16];

		strcpy(this->Addr, addr) ;
	}else
	{
		this->Addr = NULL;
		return false;
	}

	if(port != 0)
		this->Port = port;
	else
		return false;


	this->Timeout.tv_sec  = timeout.tv_sec;
	this->Timeout.tv_usec = timeout.tv_usec;

	return this->Connect();

}


//-----------------------------------------------------------------------------


bool TCP_COM::Disconnect()
{
	int iResult = closesocket(this->Client);
	if (iResult == SOCKET_ERROR)
	{
		int error = WSAGetLastError();
//		Memo1->Lines->Append("Erro ao finalizar o socket, Erro " + AnsiString(WSAGetLastError()));
		WSACleanup();
		return false;
	}
//	Memo1->Lines->Append("Desconectado com sucesso");
//	Button1->Caption =  "Connect";
	WSACleanup();
	return true;

}


//-----------------------------------------------------------------------------


bool TCP_COM::Send(BYTE *buf , WORD len)
{


	int iResult = 99 ;
	iResult = send( this->Client, buf , len, 0 );

 	if (iResult == SOCKET_ERROR)
	{
//		Memo1->Lines->Add("ERROR: " + WSAGetLastError());
		return false;

	}else
	{
		return true;

	}

}


//-----------------------------------------------------------------------------


int TCP_COM::Receive(BYTE *buf , WORD size )
{
	int iResult = 0 ;
	iResult = recv(this->Client, buf, size, 0);

	if(iResult == SOCKET_ERROR )
	 {
			if (WSAGetLastError() == 10035)
			{
				return 0;
			}
			return -1;
	 }else
	 {
		return iResult;
	 }


}


//-----------------------------------------------------------------------------


bool TCP_COM::Reconnect()
{


}

//-----------------------------------------------------------------------------

int TCP_COM::GetError()
{
    return WSAGetLastError();

}

