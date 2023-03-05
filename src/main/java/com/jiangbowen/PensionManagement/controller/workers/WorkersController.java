package com.jiangbowen.PensionManagement.controller.workers;

import com.jiangbowen.PensionManagement.entity.Message;
import com.jiangbowen.PensionManagement.entity.Workers;
import com.jiangbowen.PensionManagement.service.workers.WorkersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
    @RequestMapping("workers")
public class WorkersController {
    @Autowired
    private WorkersService workersService;
    @RequestMapping("getall")
    @ResponseBody
    public Message<ArrayList<Workers> > getAll(HttpSession session, HttpServletResponse response)throws Exception
    {
        Message<ArrayList<Workers>> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        ArrayList<Workers> workerss = workersService.getAll();
        msg.setMessage(workerss);
        msg.setStatus(200);
        return msg;
    }
    @RequestMapping("upnid")//将需要修改的护工id存入session
    @ResponseBody
    public Message<String> UpNid(Integer id,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        session.setAttribute("id",id);//将需要修改的护工id存入session
        msg.setStatus(200);
        return msg;
    }
    @RequestMapping("getworkersid")
    @ResponseBody
    public Message<Workers> getWorkersId(Integer id,HttpSession session, HttpServletResponse response) throws Exception {
        Message<Workers> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            try {
                Workers getworkers = workersService.getWorkersById(id);
                if(getworkers==null)
                {
                    msg.setStatus(400);//该数据不存在
                }
                msg.setStatus(200);
                msg.setMessage(getworkers);
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

    // getworkers
    @RequestMapping("getworkers")
    @ResponseBody
    public Message<Workers> getWorkersById(HttpSession session, HttpServletResponse response) throws Exception {
        Message<Workers> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            Integer id =(Integer) session.getAttribute("id");
            try {
                Workers getworkers = workersService.getWorkersById(id);
                if(getworkers==null)
                {
                    msg.setStatus(400);//该数据不存在
                }
                msg.setStatus(200);
                msg.setMessage(getworkers);
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
    public Message<String> Update(Workers workers,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        try {
            Integer id = (Integer) session.getAttribute("id");
            workers.setId(id);
            int result;
            try {
                result= workersService.Update(workers);
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

        System.out.println(workers);
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
            result= workersService.Del(id);
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

    @RequestMapping("add")//将需要修改的护工id存入session
    @ResponseBody
    public Message<String> Add(Workers workers,HttpSession session, HttpServletResponse response) throws Exception {
        Message<String> msg=new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("/user/exit");
        }
        int result;
        try {
            result= workersService.Add(workers);
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
