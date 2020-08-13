package com.bw.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bw.entity.Depart;
import com.bw.entity.Emp;
import com.bw.entity.Job;

/**
 * 
 * 1.selectEmp����,selectEmpById
 * 
 *
 */
public interface EmpMapper {
	//empname Ա����
	public List<Emp> selectEmp(@Param("empname")String empname);
		
	public Emp selectEmpById(Integer empid);
	
	public List<Depart> getDepartList();
	
	public List<Job> getJobList();
	
	public int insertEmp(Emp emp);
	
	public int deleteEmp(Integer empid);
	
	
	
	//*************************关联查询常用的一种方式
	
	public Depart selectDepartById(Integer departid);

}
