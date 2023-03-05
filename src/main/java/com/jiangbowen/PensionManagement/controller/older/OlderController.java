package com.jiangbowen.PensionManagement.controller.older;

import com.jiangbowen.PensionManagement.entity.Message;
import com.jiangbowen.PensionManagement.entity.Older;
import com.jiangbowen.PensionManagement.service.older.OlderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
    @RequestMapping("older")
public class OlderController {
    @Autowired
    private OlderService olderService;
    @RequestMapping("getall")
    @ResponseBody
    public Message<ArrayList<Older> > getAll(HttpSession session, HttpServletResponse response)throws Exception
    {
        Message<ArrayList<Older>> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        ArrayList<Older> olders = olderService.getAll();
        msg.setMessage(olders);
        msg.setStatus(200);
        return msg;
    }
    @RequestMapping("upnid")//将需要修改的老人id存入session
    @ResponseBody
    public Message<String> UpNid(Integer id,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        session.setAttribute("id",id);//将需要修改的老人id存入session
        msg.setStatus(200);
        return msg;
    }
    @RequestMapping("getolderid")
    @ResponseBody
    public Message<Older> getOlderId(Integer id,HttpSession session, HttpServletResponse response) throws Exception {
        Message<Older> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            try {
                Older getolder = olderService.getOlderById(id);
                if(getolder==null)
                {
                    msg.setStatus(400);//该数据不存在
                }
                msg.setStatus(200);
                msg.setMessage(getolder);
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

    // getolder
    @RequestMapping("getolder")
    @ResponseBody
    public Message<Older> getOlderById(HttpSession session, HttpServletResponse response) throws Exception {
        Message<Older> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            Integer id =(Integer) session.getAttribute("id");
            try {
                Older getolder = olderService.getOlderById(id);
                if(getolder==null)
                {
                    msg.setStatus(400);//该数据不存在
                }
                msg.setStatus(200);
                msg.setMessage(getolder);
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
    public Message<String> Update(Older older,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            Integer id = (Integer)session.getAttribute("id");
            older.setId(id);
            int result;
            try {
                result= olderService.Update(older);
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

        System.out.println(older);
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
            result= olderService.Del(id);
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

    @RequestMapping("add")//将需要修改的老人id存入session
    @ResponseBody
    public Message<String> Add(Older older,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        int result;
        try {
            result= olderService.Add(older);
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
