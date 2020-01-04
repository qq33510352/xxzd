package com.xxzd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 页面控制层
 * @启程 Hasee
 */
@Controller
public class PageController {
	@RequestMapping("{page}")
	public String page(@PathVariable String page) {
		return page;
	}
}
