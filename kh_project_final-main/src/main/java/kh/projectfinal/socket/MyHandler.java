package kh.projectfinal.socket;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.projectfinal.mapper.EmpInfo;

public class MyHandler extends TextWebSocketHandler {

	public Map<WebSocketSession, EmpInfo> clients = new HashMap<WebSocketSession, EmpInfo>();

	
	public MyHandler() {
		System.out.println("MyHandler()..........");
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("connecting..............");
		if (!clients.containsKey(session)) {
			clients.put(session, null);
		}

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message)  {
		System.out.println("\tMyHandler.handleTextMessage()---------------------");
		System.out.println("\tdata : " + message.getPayload());
		
		
		Gson gson = new GsonBuilder().create();
		EmpInfo info = null;
		String posStr = "";
		System.out.println("\t payLoad : " + message.getPayloadLength());
		String jsonString = "'";
		info = gson.fromJson(message.getPayload(), EmpInfo.class);
		
		System.out.println("\tinfo : " + info);

		
		try {
			switch (info.getCommand()) {
			case "login":
	
				if ( clients.containsKey(session) ) {
					clients.put(session, info);
					System.out.println("key is null.........");
				}
				System.out.println("client size : " +  clients.size());
				break;
	
			case "approv":
				System.out.println("\t\t 상신-------");
				
				
				for (WebSocketSession s : clients.keySet()) {
					if( s == null || !s.isOpen() ) {
						clients.remove(s);
						continue;
					}
					EmpInfo targetInfo = clients.get(s);
					if(targetInfo==null) {
						System.out.println("v is null");
						continue;
					}
					if(s==null) {
						System.out.println("s is null");
						continue;
					}
					
				
					System.out.println("part : " + info.getDepartNo() + "," + targetInfo.getDepartNo());
					if (info.getClassNo() == targetInfo.getClassNo() && 
							info.getDepartNo() == targetInfo.getDepartNo() )  {
						System.out.println("send:" + message.getPayload());
						s.sendMessage(message);
					}
				}
				break;
	
			case "결재":
			case "보류":
			case "반려":
	
				break;
			}
		}catch(Exception ex) {
			System.out.println("MyHandler error.........: ");
			ex.printStackTrace();
		}
		
		

	}

}
