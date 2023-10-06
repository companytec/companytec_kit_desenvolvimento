#ifndef TCPIP_INCLUDED
#define TCPIP_INCLUDED

#ifdef __cplusplus
extern "C" {
#endif

#include <windows.h>




class TCP_COM
{
	private:

		TIMEVAL Timeout;
		char    *Addr;
		WORD    Port;
		SOCKET  Client;

//------------------------------------------------------
	public:

		TCP_COM();
		TCP_COM( char * addr, int port , TIMEVAL timeout);

	 	bool Connect(void);

		bool Connect(char * addr , int port, TIMEVAL timeout);

		bool Disconnect();

		bool Reconnect();

		bool Send(BYTE *buf , WORD len);

		int Receive(BYTE *Buf , WORD Size );

		int GetError();

};








#ifdef __cplusplus
} /* extern "C" */
#endif

#endif
