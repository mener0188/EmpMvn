package com.bw.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.sql.PagerUtils;
import com.bw.entity.Depart;
import com.bw.entity.Emp;
import com.bw.entity.Job;
import com.bw.mapper.EmpMapper;
import com.bw.util.PageUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

//注意:本案例含有两种常用的关联查询方式
@Controller
public class EmpController {

	@Autowired
	EmpMapper empMapper;
	
	@RequestMapping("list")
	public String list(@RequestParam(defaultValue="1") int pageNum, Model model,
			HttpServletRequest request, String empname){
		if(empname==null){
			empname="";
		}
		
		PageHelper.startPage(pageNum, 4);
//		PageHelper.offsetPage(offset, limit)
		
		List<Emp> empList = empMapper.selectEmp(empname);
		System.out.println(empList.size()+"-----------------------------------");
		for (Emp emp : empList) {
			//departid在emp表里,多对一,外键在多的表中
			//根据departid--查询departname
			Depart depart = empMapper.selectDepartById(emp.getDepartid());
			emp.setDepartname(depart.getDepartname());
		}
		
		
		
		PageInfo<Emp> page=new PageInfo<Emp>(empList);
		PageUtils.page(pageNum, page, model, "&empname="+empname);
		
		request.setAttribute("empList", empList);
		request.setAttribute("page", page);
		request.setAttribute("empname", empname);
		return "list";
	}
	
	@RequestMapping("toAdd")
	public String toAdd(){
		return "add";
	}
	
	@RequestMapping("getDepartList")
	@ResponseBody
	public List<Depart> getDepartList(){
		List<Depart> departList = empMapper.getDepartList();
		return departList;
	}
	
	@RequestMapping("getJobList")
	@ResponseBody
	public List<Job> getJobList(){
		List<Job> jobList = empMapper.getJobList();
		return jobList;
	}
	
	@RequestMapping("add")
	@ResponseBody
	public String add(Emp emp){
		empMapper.insertEmp(emp);
		return "success";
	}
	
	@RequestMapping("del")
	@ResponseBody
	public String del(int empid){
		empMapper.deleteEmp(empid);
		return "success";
	}
	
	@RequestMapping("plsc")
	@ResponseBody
	public String plsc(Integer[] ids){
		for (Integer empid : ids) {
			this.del(empid);
		}
		
		return "success";
	}
	
	@RequestMapping("toUpdate")
	public String toUpdate(){
		return "update";
	}
	
	@RequestMapping("getEmpById")
	@ResponseBody
	public Emp getEmpById(Integer empid){
		Emp emp = empMapper.selectEmpById(empid);
		return emp;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
