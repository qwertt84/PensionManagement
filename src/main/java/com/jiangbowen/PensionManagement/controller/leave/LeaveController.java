package com.jiangbowen.PensionManagement.controller.leave;

import com.jiangbowen.PensionManagement.entity.Message;
import com.jiangbowen.PensionManagement.entity.Leave;
import com.jiangbowen.PensionManagement.service.leave.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;


@Controller
@RequestMapping("leave")//请假
public class LeaveController {
    @Autowired
    private LeaveService leaveService;
    @RequestMapping("getall")//获取所有请假
    @ResponseBody
    public Message<ArrayList<Leave>> getAll(HttpSession session, HttpServletResponse response) throws Exception {
        Message<ArrayList<Leave>> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        ArrayList<Leave> leaveAll = leaveService.getAll();
        msg.setMessage(leaveAll);
        msg.setStatus(200);
        return msg;
    }
    @RequestMapping("upnid")//将需要修改的请假id存入session
    @ResponseBody
    public Message<String> UpNid(Integer id,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        session.setAttribute("id",id);//将需要修改的请假id存入session
        msg.setStatus(200);
        return msg;
    }
   // getleave
   @RequestMapping("getleave")
   @ResponseBody
   public Message<Leave> getLeaveById(HttpSession session, HttpServletResponse response) throws Exception {
       Message<Leave> msg=new Message<>();
       String userid = (String) session.getAttribute("userid");
       if(userid==null)
       {
           response.sendRedirect("/user/exit");
       }
       try {
           Integer id =(Integer) session.getAttribute("id");
           try {
               Leave getleave = leaveService.getLeaveById(id);
               if(getleave==null)
               {
                   msg.setStatus(400);//该数据不存在
               }
               msg.setStatus(200);
               msg.setMessage(getleave);
           }catch (Exception e)
           {
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
    public Message<String> Update(Leave leave,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            Integer id = (Integer)session.getAttribute("id");
            java.util.Date time = new java.util.Date();
            leave.setCreate_time(new Date(time.getTime()));
            leave.setId(id);
            int result;
            try {
                result= leaveService.Update(leave);
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

        System.out.println(leave);
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
            result= leaveService.Del(id);
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

    @RequestMapping("add")//将需要修改的请假id存入session
    @ResponseBody
    public Message<String> Add(Leave leave,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        int result;
        java.util.Date time = new java.util.Date();
        leave.setCreate_time(new Date(time.getTime()));
        try {
            result= leaveService.Add(leave);
        }catch (Exception e)
        {
            msg.setStatus(401);//数据库错误
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
