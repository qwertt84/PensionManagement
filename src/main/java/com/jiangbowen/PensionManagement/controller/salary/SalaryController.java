package com.jiangbowen.PensionManagement.controller.salary;

import com.jiangbowen.PensionManagement.entity.Message;
import com.jiangbowen.PensionManagement.entity.Salary;
import com.jiangbowen.PensionManagement.service.salary.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;

@Controller
    @RequestMapping("salary")
public class SalaryController {
    @Autowired
    private SalaryService salaryService;
    @RequestMapping("getall")
    @ResponseBody
    public Message<ArrayList<Salary> > getAll(HttpSession session, HttpServletResponse response)throws Exception
    {
        Message<ArrayList<Salary>> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        ArrayList<Salary> salarys = salaryService.getAll();
        msg.setMessage(salarys);
        msg.setStatus(200);
        return msg;
    }
    @RequestMapping("upnid")//将需要修改的工资id存入session
    @ResponseBody
    public Message<String> UpNid(Integer id,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        session.setAttribute("id",id);//将需要修改的工资id存入session
        msg.setStatus(200);
        return msg;
    }
    @RequestMapping("getsalaryid")
    @ResponseBody
    public Message<Salary> getSalaryId(Integer id,HttpSession session, HttpServletResponse response) throws Exception {
        Message<Salary> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            try {
                Salary getsalary = salaryService.getSalaryById(id);
                if(getsalary==null)
                {
                    msg.setStatus(400);//该数据不存在
                }
                msg.setStatus(200);
                msg.setMessage(getsalary);
            }catch (Exception e)
            {
                System.out.println(e.getMessage());
                msg.setStatus(401);//数据库异常
                return msg;
            }

        }catch (Exception e)
        {
            msg.setStatus(402);//session失效了
            return msg;
        }

        return msg;
    }

    // getsalary
    @RequestMapping("getsalary")
    @ResponseBody
    public Message<Salary> getSalaryById(HttpSession session, HttpServletResponse response) throws Exception {
        Message<Salary> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            Integer id =(Integer) session.getAttribute("id");
            try {
                Salary getsalary = salaryService.getSalaryById(id);
                if(getsalary==null)
                {
                    msg.setStatus(400);//该数据不存在
                }
                msg.setStatus(200);
                msg.setMessage(getsalary);
            }catch (Exception e)
            {
                System.out.println(e.getMessage());
                msg.setStatus(401);//数据库异常
                return msg;
            }

        }catch (Exception e)
        {
            msg.setStatus(402);//session失效了
            return msg;
        }

        return msg;
    }

    @RequestMapping("update")
    @ResponseBody
    public Message<String> Update(Salary salary,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            Integer id = (Integer) session.getAttribute("id");
            salary.setId(id);
            java.util.Date time = new java.util.Date();
            salary.setCreate_time(new Date(time.getTime()));
            int result;
            try {
                result= salaryService.Update(salary);
            }catch (Exception e)
            {
                msg.setStatus(401);//数据库错误
                return msg;
            }
            if(result==1) {
                msg.setStatus(200);//修改成功
            }
            else if(result==0)
            {
                msg.setStatus(220);//修改失败
            }
        }catch (Exception e)
        {
            msg.setStatus(402);//session失效了
        }
        return msg;
    }
    @RequestMapping("del")
    @ResponseBody
    public Message<String> Del(Integer id,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        int result;
        try {
            result= salaryService.Del(id);
        }catch (Exception e)
        {
            msg.setStatus(401);//数据库错误
            return msg;
        }
        if(result==1) {
            msg.setStatus(200);
        }
        else if(result==0)
        {
            msg.setStatus(220);//删除失败
        }
        return msg;
    }

    @RequestMapping("add")//将需要修改的工资id存入session
    @ResponseBody
    public Message<String> Add(Salary salary,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        java.util.Date time = new java.util.Date();
        salary.setCreate_time(new Date(time.getTime()));
        int result;
        try {
            result= salaryService.Add(salary);
        }catch (Exception e)
        {
            msg.setStatus(401);//数据库错误
            System.out.println(e.getMessage());
            return msg;
        }
        if(result==1) {
            msg.setStatus(200);//添加成功
        }
        else if(result==0)
        {
            msg.setStatus(220);//添加失败
        }
        return msg;
    }

}
