package com.travel.user.controller;

import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.travel.user.entity.DataInfo;
import com.travel.user.service.impl.DataInfoServiceImpl;

import net.sf.json.JSONObject;
import net.sourceforge.pinyin4j.PinyinHelper;


@Controller
@RequestMapping("/MapController") 
public class MapController {

    @Autowired
    private DataInfoServiceImpl dataInfoService;

    
    @RequestMapping("/mapDemo.do") //url
  //url=http://localhost:8080/TravelDemo/MapController/mapDemo.do
  public String mapDemo(HttpServletRequest request, HttpServletResponse response){
    	System.out.println();
  	return "/demo/map/map";
  }
    
    @ResponseBody
    @RequestMapping(value = "/ajaxGetAll.do", method = RequestMethod.POST)
    public Object ajaxGetAll() {
        JSONObject jsonObject = new JSONObject();
        try {
            List<DataInfo> dataInfos = dataInfoService.queryAll();
            if (dataInfos != null && dataInfos.size() > 0) {
                jsonObject.put("dataInfos", dataInfos);
                jsonObject.put("message","success");
            }else{
                jsonObject.put("message","fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }

    @ResponseBody
    @RequestMapping(value = "/ajaxAddDataInfo.do")
    public Object ajaxAddDataInfo(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        try {
            String StartCityName = request.getParameter("StartCityName").trim();
            String PassCityName = request.getParameter("PassCityName").trim();
            String StartX_axis = request.getParameter("StartX_axis").trim();
            String StartY_axis = request.getParameter("StartY_axis").trim();
            String PassX_axis = request.getParameter("PassX_axis").trim();
            String PassY_axis = request.getParameter("PassY_axis").trim();
//
            DataInfo dataInfo = new DataInfo();
            dataInfo.setCreatIndoTime(new Date());
            dataInfo.setUsercode("admin");
            dataInfo.setIsdelete("0");
            Random r = new java.util.Random();
            dataInfo.setOid(Integer.toString(r.nextInt(10)));
            dataInfo.setStartcityName(StartCityName);
            dataInfo.setStartcityName_zh(getPinYinHeadChar(StartCityName));
            dataInfo.setStartx_axis(Double.parseDouble(StartX_axis));
            dataInfo.setStarty_axis(Double.parseDouble(StartY_axis));
            dataInfo.setPasscityName(PassCityName);
            dataInfo.setPasscityName_zh(getPinYinHeadChar(PassCityName));
            dataInfo.setPassx_axis(Double.parseDouble(PassX_axis));
            dataInfo.setPassy_axis(Double.parseDouble(PassY_axis));
            dataInfo.setStart_deviceInfo("璧峰绔欑偣");
            dataInfo.setPass_deviveInfo("閫斿緞绔欑偣");

            dataInfoService.addDataInfo(dataInfo);
            jsonObject.put("message", "成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }

    @ResponseBody
    @RequestMapping(value = "/ajaxEidtDataInfo.do")
    public Object ajaxEidtDataInfo(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        try {
            String startcityName = request.getParameter("startcityName");
            String passcityName = request.getParameter("passcityName");
            String oid = request.getParameter("oid");
            System.out.println(passcityName + startcityName + "````" + oid);
            List<DataInfo> dataInfo = null;
            DataInfo dataIn = new DataInfo();
            if (oid != null && !("").equals(oid)) {
                dataInfo = dataInfoService.queryByOid(oid);
            }
            if (dataInfo != null && dataInfo.size() > 0) {
                dataIn = dataInfo.get(0);
                Double Passx_axis =dataIn.getStartx_axis();
                Double Passy_axis =dataIn.getStarty_axis();
                Double Startx_axis =dataIn.getPassx_axis();
                Double Starty_axis =dataIn.getPassy_axis();

        System.out.println(dataIn.getStartx_axis()+"``"+dataIn.getStarty_axis()+"1111"+dataIn.getPassx_axis()+dataIn.getPassy_axis());
                dataIn.setPasscityName(passcityName);
                dataIn.setPasscityName_zh(getPinYinHeadChar(passcityName));
                System.out.println("缁堢偣"+getPinYinHeadChar(passcityName));
                dataIn.setPassx_axis(Passx_axis);
                dataIn.setPassy_axis(Passy_axis);
                System.out.println(Passx_axis+"```````"+Passy_axis);
                dataIn.setStartcityName(startcityName);
                dataIn.setStartcityName_zh(getPinYinHeadChar(startcityName));
                System.out.println(""+getPinYinHeadChar(startcityName));
                dataIn.setStartx_axis(Startx_axis);
                dataIn.setStarty_axis(Starty_axis);
                System.out.println(Startx_axis+"```````"+Starty_axis);
            }
            dataInfoService.updateByOid(dataIn);
            jsonObject.put("message", "鎴愬姛");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
    @ResponseBody
    @RequestMapping(value = "/ajaxDeleteDataInfo.do")
    public Object ajaxDeleteDataInfo(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        try {
            String oid = request.getParameter("oid");

            List<DataInfo> dataInfo = null;
            DataInfo dataIn = new DataInfo();
            if (oid != null && !("").equals(oid)) {
                dataInfo = dataInfoService.queryByOid(oid);
            }
            if (dataInfo != null && dataInfo.size() > 0) {
                dataIn = dataInfo.get(0);
                dataIn.setIsdelete("1");//琚垹闄�
            }
            dataInfoService.updateByOidDelete(dataIn);
            jsonObject.put("message", "鎴愬姛");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
    @ResponseBody
    @RequestMapping(value = "/ajaxDeleteLine.do")
    public Object ajaxDeleteLine(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        try {
            String startx_axis = request.getParameter("startx_axis");
            String starty_axis = request.getParameter("starty_axis");
            String passx_axis = request.getParameter("passx_axis");
            String passy_axis = request.getParameter("passy_axis");
       //     System.out.println(startx_axis+"~~~~~~"+starty_axis+"``````"+passx_axis+"~~~~~"+passy_axis);
            DataInfo line = new DataInfo();
            line.setStartx_axis(Double.parseDouble(startx_axis));
            line.setStarty_axis(Double.parseDouble(starty_axis));
            line.setPassx_axis(Double.parseDouble(passx_axis));
            line.setPassy_axis(Double.parseDouble(passy_axis));
            dataInfoService.deleteLine(line);
            jsonObject.put("message", "鎴愬姛");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }

    // 中文转拼音 取首字母
    public static String getPinYinHeadChar(String str) {

        String convert = "";
        for (int j = 0; j < str.length(); j++) {
            char word = str.charAt(j);
            String[] pinyinArray = PinyinHelper.toHanyuPinyinStringArray(word);
            if (pinyinArray != null) {
                convert += pinyinArray[0].charAt(0);
            } else {
                convert += word;
            }
        }
        System.out.println(convert);
        return convert;
    }

}


