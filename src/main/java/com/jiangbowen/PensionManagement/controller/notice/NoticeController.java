package com.jiangbowen.PensionManagement.controller.notice;

import com.jiangbowen.PensionManagement.entity.Message;
import com.jiangbowen.PensionManagement.entity.Notice;
import com.jiangbowen.PensionManagement.service.notice.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;



@Controller
@RequestMapping("notice")//公告
public class NoticeController {
    @Autowired
    private NoticeService noticeService;
    @RequestMapping("getall")//获取所有公告
    @ResponseBody
    public Message<ArrayList<Notice>> getAll(HttpSession session, HttpServletResponse response) throws Exception {
        Message<ArrayList<Notice>> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        ArrayList<Notice> noticeAll = noticeService.getAll();
        msg.setMessage(noticeAll);
        msg.setStatus(200);
        return msg;
    }
    @RequestMapping("upnid")//将需要修改的公告id存入session
    @ResponseBody
    public Message<String> UpNid(Integer id,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        session.setAttribute("id",id);//将需要修改的公告id存入session
        msg.setStatus(200);
        return msg;
    }
   // getnotice
   @RequestMapping("getnotice")
   @ResponseBody
   public Message<Notice> getNoticeById(HttpSession session, HttpServletResponse response) throws Exception {
       Message<Notice> msg=new Message<>();
       String userid = (String) session.getAttribute("userid");
       if(userid==null)
       {
           response.sendRedirect("/user/exit");
       }
       try {
           Integer id =(Integer) session.getAttribute("id");
           try {
               Notice getnotice = noticeService.getNoticeById(id);
               if(getnotice==null)
               {
                   msg.setStatus(400);//该数据不存在
               }
               msg.setStatus(200);
               msg.setMessage(getnotice);
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
    public Message<String> Update(Notice notice,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            Integer id = (Integer)session.getAttribute("id");
            java.util.Date time = new java.util.Date();
            notice.setCreate_time(new Date(time.getTime()));
            notice.setId(id);
            int result;
            try {
                result= noticeService.Update(notice);
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

        System.out.println(notice);
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
            result= noticeService.Del(id);
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

    @RequestMapping("add")//将需要修改的公告id存入session
    @ResponseBody
    public Message<String> Add(Notice notice,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        int result;
        java.util.Date time = new java.util.Date();
        notice.setCreate_time(new Date(time.getTime()));
        try {
            result= noticeService.Add(notice);
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
