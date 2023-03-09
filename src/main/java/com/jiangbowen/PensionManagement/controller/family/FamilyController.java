package com.jiangbowen.PensionManagement.controller.family;

import com.jiangbowen.PensionManagement.entity.Message;
import com.jiangbowen.PensionManagement.entity.Family;
import com.jiangbowen.PensionManagement.service.family.FamilyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
    @RequestMapping("family")
public class FamilyController {
    @Autowired
    private FamilyService familyService;
    @RequestMapping("getall")
    @ResponseBody
    public Message<ArrayList<Family> > getAll(HttpSession session, HttpServletResponse response)throws Exception
    {
        Message<ArrayList<Family>> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        ArrayList<Family> familys = familyService.getAll();
        msg.setMessage(familys);
        msg.setStatus(200);
        return msg;
    }
    @RequestMapping("upnid")//将需要修改的家属id存入session
    @ResponseBody
    public Message<String> UpNid(Integer id,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        session.setAttribute("id",id);//将需要修改的家属id存入session
        msg.setStatus(200);
        return msg;
    }
    @RequestMapping("getfamilyid")
    @ResponseBody
    public Message<Family> getFamilyId(Integer id,HttpSession session, HttpServletResponse response) throws Exception {
        Message<Family> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            try {
                Family getfamily = familyService.getFamilyById(id);
                if(getfamily==null)
                {
                    msg.setStatus(400);//该数据不存在
                }
                msg.setStatus(200);
                msg.setMessage(getfamily);
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

    // getfamily
    @RequestMapping("getfamily")
    @ResponseBody
    public Message<Family> getFamilyById(HttpSession session, HttpServletResponse response) throws Exception {
        Message<Family> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            Integer id =(Integer) session.getAttribute("id");
            try {
                Family getfamily = familyService.getFamilyById(id);
                if(getfamily==null)
                {
                    msg.setStatus(400);//该数据不存在
                }
                msg.setStatus(200);
                msg.setMessage(getfamily);
                session.removeAttribute("id");
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
    public Message<String> Update(Family family,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            int result;
            try {
                result= familyService.Update(family);
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
            result= familyService.Del(id);
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

    @RequestMapping("add")//将需要修改的家属id存入session
    @ResponseBody
    public Message<String> Add(Family family,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        int result;
        try {
            result= familyService.Add(family);
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
