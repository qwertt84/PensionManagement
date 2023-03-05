package com.jiangbowen.PensionManagement.controller.older;

import com.jiangbowen.PensionManagement.entity.Message;
import com.jiangbowen.PensionManagement.entity.OlderStatus;
import com.jiangbowen.PensionManagement.service.older.OlderStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;

@Controller
@RequestMapping("olderstatus")
public class OlderStatusController {
    @Autowired
    private OlderStatusService olderStatusService;
    @RequestMapping("getall")
    @ResponseBody
    public Message<ArrayList<OlderStatus> > getAll(HttpSession session, HttpServletResponse response)throws Exception
    {
        Message<ArrayList<OlderStatus>> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        ArrayList<OlderStatus> olderstatuss = olderStatusService.getAll();
        msg.setMessage(olderstatuss);
        msg.setStatus(200);
        return msg;
    }
    @RequestMapping("upnid")//将需要修改的老人状态id存入session
    @ResponseBody
    public Message<String> UpNid(Integer id,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        session.setAttribute("id",id);//将需要修改的老人状态id存入session
        msg.setStatus(200);
        return msg;
    }

    @RequestMapping("getolderstatus")
    @ResponseBody
    public Message<OlderStatus> getOlderstatusById(HttpSession session, HttpServletResponse response) throws Exception {
        Message<OlderStatus> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            Integer id =(Integer) session.getAttribute("id");
            try {
                OlderStatus getolderstatus = olderStatusService.getOlderStatusById(id);
                if(getolderstatus==null)
                {
                    msg.setStatus(400);//该数据不存在
                }
                msg.setStatus(200);
                msg.setMessage(getolderstatus);
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
    public Message<String> Update(OlderStatus olderstatus,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            Integer id = (Integer)session.getAttribute("id");
            olderstatus.setId(id);
            java.util.Date time = new java.util.Date();
            olderstatus.setCreate_time(new Date(time.getTime()));
            int result;
            try {
                result= olderStatusService.Update(olderstatus);
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

        System.out.println(olderstatus);
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
            result= olderStatusService.Del(id);
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

    @RequestMapping("add")//将需要修改的老人状态id存入session
    @ResponseBody
    public Message<String> Add(OlderStatus olderstatus,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        java.util.Date time = new java.util.Date();
        olderstatus.setCreate_time(new Date(time.getTime()));
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        int result;
        try {
            result= olderStatusService.Add(olderstatus);
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
