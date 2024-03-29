package com.jiangbowen.PensionManagement.controller.malfunction;

import com.jiangbowen.PensionManagement.entity.Message;
import com.jiangbowen.PensionManagement.entity.Malfunction;
import com.jiangbowen.PensionManagement.service.malfunction.MalfunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;


@Controller
@RequestMapping("malfunction")//事故
public class MalfuntionController {
    @Autowired
    private MalfunctionService malfunctionService;
    @RequestMapping("getall")//获取所有事故
    @ResponseBody
    public Message<ArrayList<Malfunction>> getAll(HttpSession session, HttpServletResponse response) throws Exception {
        Message<ArrayList<Malfunction>> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        ArrayList<Malfunction> malfunctionAll = malfunctionService.getAll();
        msg.setMessage(malfunctionAll);
        msg.setStatus(200);
        return msg;
    }
    @RequestMapping("upnid")//将需要修改的事故id存入session
    @ResponseBody
    public Message<String> UpNid(Integer id,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        session.setAttribute("id",id);//将需要修改的事故id存入session
        msg.setStatus(200);
        return msg;
    }
   // getmalfunction
   @RequestMapping("getmalfunction")
   @ResponseBody
   public Message<Malfunction> getMalfunctionById(HttpSession session, HttpServletResponse response) throws Exception {
       Message<Malfunction> msg=new Message<>();
       String userid = (String) session.getAttribute("userid");
       if(userid==null)
       {
           response.sendRedirect("/user/exit");
       }
       try {
           Integer id =(Integer) session.getAttribute("id");
           try {
               Malfunction getmalfunction = malfunctionService.getMalfunctionById(id);
               if(getmalfunction==null)
               {
                   msg.setStatus(400);//该数据不存在
               }
               msg.setStatus(200);
               msg.setMessage(getmalfunction);
               session.removeAttribute("id");
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
    public Message<String> Update(Malfunction malfunction,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            java.util.Date time = new java.util.Date();
            malfunction.setCreate_time(new Date(time.getTime()));
            int result;
            try {
                result= malfunctionService.Update(malfunction);
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

        System.out.println(malfunction);
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
            result= malfunctionService.Del(id);
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

    @RequestMapping("add")//将需要修改的事故id存入session
    @ResponseBody
    public Message<String> Add(Malfunction malfunction,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        int result;
        java.util.Date time = new java.util.Date();
        malfunction.setCreate_time(new Date(time.getTime()));
        try {
            result= malfunctionService.Add(malfunction);
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
