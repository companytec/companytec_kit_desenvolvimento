using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports;
using System.Net;
using System.Net.Sockets;
using System.IO;
using System.Collections;
using System.Threading;

namespace ComPort
{
    public partial class Form1 : Form
    {

        string ip;
        TcpClient client;
        NetworkStream stream;
        public Form1()
        {
            InitializeComponent();
        }        

        private void btnSend_Click(object sender, EventArgs e)
        {
            string command = txtCommand.Text;
            Byte[] data = System.Text.Encoding.ASCII.GetBytes(command);
            stream.Write(data, 0, data.Length);
            data = new Byte[256];
            String responseData = String.Empty;            
            Int32 bytes = stream.Read(data, 0, data.Length);
            responseData = System.Text.Encoding.ASCII.GetString(data, 0, bytes);
            txtAnswer.Text = responseData;
        }

        private void btnConect_Click(object sender, EventArgs e)
        {
            String ip = txtIp.Text;
            Int32 port = Convert.ToInt32(txtPort.Text);            

            client = new TcpClient(ip, port);
            stream = client.GetStream();
            ckConected.Checked = true;
        }

        private void btnDisconect_Click(object sender, EventArgs e)
        {
            client.Close();
            stream.Close();
            ckConected.Checked = false;
        }
    }
}
