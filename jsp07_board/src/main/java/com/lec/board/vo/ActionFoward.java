package com.lec.board.vo;

public class ActionFoward {

	private boolean isRedirect = false;
	private String path = null;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	public String getPath() {
		return path;  // xxxx.do?p=100&f=writer&q=xxxx&fn=yyyy
	}
	
	public void setPath(String path) {
		this.path = path;
	}
}
