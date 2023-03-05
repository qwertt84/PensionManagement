package com.jiangbowen.PensionManagement.controller.cost;

import com.jiangbowen.PensionManagement.entity.Cost;
import com.jiangbowen.PensionManagement.entity.Message;
import com.jiangbowen.PensionManagement.service.cost.CostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;


@Controller
@RequestMapping("cost")//费用
public class CostController {
    @Autowired
    private CostService costService;
    @RequestMapping("getall")//获取所有费用
    @ResponseBody
    public Message<ArrayList<Cost>> getAll(HttpSession session, HttpServletResponse response) throws Exception {
        Message<ArrayList<Cost>> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        ArrayList<Cost> costAll = costService.getAll();
        msg.setMessage(costAll);
        msg.setStatus(200);
        return msg;
    }
    @RequestMapping("upnid")//将需要修改的费用id存入session
    @ResponseBody
    public Message<String> UpNid(Integer id,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        session.setAttribute("id",id);//将需要修改的费用id存入session
        msg.setStatus(200);
        return msg;
    }
   // getcost
   @RequestMapping("getcost")
   @ResponseBody
   public Message<Cost> getCostById(HttpSession session, HttpServletResponse response) throws Exception {
       Message<Cost> msg=new Message<>();
       String userid = (String) session.getAttribute("userid");
       if(userid==null)
       {
           response.sendRedirect("/user/exit");
       }
       try {
           Integer id =(Integer) session.getAttribute("id");
           try {
               Cost getcost = costService.getCostById(id);
               if(getcost==null)
               {
                   msg.setStatus(400);//该数据不存在
               }
               msg.setStatus(200);
               msg.setMessage(getcost);
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
    public Message<String> Update(Cost cost,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            Integer id = (Integer)session.getAttribute("id");
            java.util.Date time = new java.util.Date();
            cost.setCreate_time(new Date(time.getTime()));
            cost.setId(id);
            int result;
            try {
                result= costService.Update(cost);
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

        System.out.println(cost);
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
            result= costService.Del(id);
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

    @RequestMapping("add")//将需要修改的费用id存入session
    @ResponseBody
    public Message<String> Add(Cost cost,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        int result;
        java.util.Date time = new java.util.Date();
        cost.setCreate_time(new Date(time.getTime()));
        try {
            result= costService.Add(cost);
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
