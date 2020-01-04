package com.xxzd.exception;

import java.io.Serializable;

public class ServiceException extends RuntimeException implements Serializable{
	public ServiceException() {
		super();
	}
	
	public ServiceException(String msg) {
		super(msg);
	}
	
	public ServiceException(Throwable e) {
		super(e);
	}
}
