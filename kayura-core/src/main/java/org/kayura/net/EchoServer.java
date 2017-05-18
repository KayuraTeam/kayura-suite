/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.net;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class EchoServer {

	private ServerSocket socket;
	private Integer port;

	public EchoServer(Integer port) {
		this.port = port;
	}

	public void run() throws IOException {

		if (socket != null && !socket.isClosed()) {
			try {
				socket.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		try {

			socket = new ServerSocket(this.port);

			while (true) {
				Socket incoming = socket.accept();
				Runnable r = new AcceptHandler(incoming);
				Thread t = new Thread(r);
				t.start();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}

class AcceptHandler implements Runnable {

	private Socket incoming;

	public AcceptHandler(Socket incoming) {
		this.incoming = incoming;
	}

	public void run() {
		try {
			try {
				//InputStream inStram = incoming.getInputStream();
				//OutputStream outStram = incoming.getOutputStream();
				
				//Scanner in = new Scanner(inStram);

			} finally {
				incoming.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}