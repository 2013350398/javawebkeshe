package com.zc.controller;


import java.awt.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartColor;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/chart.do")
public class ChartController {

    @RequestMapping("/resultmap")
    public String resultmap(){
        return "/resultmap";
    }
    @Autowired
    HttpSession session;
    //显示柱状图
    @RequestMapping(params = "method=getYear")
    public ModelAndView getYear(HttpServletRequest request,HttpServletResponse response, ModelMap modelMap) throws Exception{
        //1. 获得数据集合
        CategoryDataset dataset = getDataSetYear();
        //2. 创建柱状图
        JFreeChart chart = ChartFactory.createBarChart("年度借阅柱状图", // 图表标题
                "年份", // 目录轴的显示标签
                "次数", // 数值轴的显示标签
                dataset, // 数据集
                PlotOrientation.VERTICAL, // 图表方向：水平、垂直
                false, // 是否显示图例(对于简单的柱状图必须是false)
                false, // 是否生成工具
                false // 是否生成URL链接
        );
        //3. 设置整个柱状图的颜色和文字（char对象的设置是针对整个图形的设置）
        chart.setBackgroundPaint(ChartColor.WHITE); // 设置总的背景颜色

        //4. 获得图形对象，并通过此对象对图形的颜色文字进行设置
        CategoryPlot p = chart.getCategoryPlot();// 获得图表对象
        p.setBackgroundPaint(ChartColor.lightGray);//图形背景颜色
        p.setRangeGridlinePaint(ChartColor.WHITE);//图形表格颜色

        //5. 设置柱子宽度
        BarRenderer renderer = (BarRenderer)p.getRenderer();
        renderer.setMaximumBarWidth(0.06);

        //解决乱码问题
        getChartByFont(chart);

        //6. 将图形转换为图片，传到前台
        String fileName = ServletUtilities.saveChartAsJPEG(chart, 700, 400, null, request.getSession());
        String chartURL=request.getContextPath() + "/chart?filename="+fileName;
        modelMap.put("chartURL", chartURL);
        return new ModelAndView("anual",modelMap);
    }

    @RequestMapping(params = "method=getMon")
    public ModelAndView getMon(HttpServletRequest request,HttpServletResponse response, ModelMap modelMap) throws Exception{
        //1. 获得数据集合
        CategoryDataset dataset = getDataSetMon();
        //2. 创建柱状图
        JFreeChart chart = ChartFactory.createBarChart("本年度每月借阅柱状图", // 图表标题
                "月份", // 目录轴的显示标签
                "次数", // 数值轴的显示标签
                dataset, // 数据集
                PlotOrientation.VERTICAL, // 图表方向：水平、垂直
                false, // 是否显示图例(对于简单的柱状图必须是false)
                false, // 是否生成工具
                false // 是否生成URL链接
        );
        //3. 设置整个柱状图的颜色和文字（char对象的设置是针对整个图形的设置）
        chart.setBackgroundPaint(ChartColor.WHITE); // 设置总的背景颜色

        //4. 获得图形对象，并通过此对象对图形的颜色文字进行设置
        CategoryPlot p = chart.getCategoryPlot();// 获得图表对象
        p.setBackgroundPaint(ChartColor.lightGray);//图形背景颜色
        p.setRangeGridlinePaint(ChartColor.WHITE);//图形表格颜色

        //5. 设置柱子宽度
        BarRenderer renderer = (BarRenderer)p.getRenderer();
        renderer.setMaximumBarWidth(0.06);

        //解决乱码问题
        getChartByFont(chart);

        //6. 将图形转换为图片，传到前台
        String fileName = ServletUtilities.saveChartAsJPEG(chart, 700, 400, null, request.getSession());
        String chartURL=request.getContextPath() + "/chart?filename="+fileName;
        modelMap.put("chartURL", chartURL);
        return new ModelAndView("anual",modelMap);
    }

    //设置文字样式
    private void getChartByFont(JFreeChart chart) {
        //1. 图形标题文字设置
        TextTitle textTitle = chart.getTitle();
        textTitle.setFont(new Font("宋体",Font.BOLD,20));
        textTitle.setPaint(Color.BLACK);

        //2. 图形X轴坐标文字的设置
        CategoryPlot plot = (CategoryPlot) chart.getPlot();
        chart.getRenderingHints().put(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_OFF);//??
        CategoryAxis axis = plot.getDomainAxis();
        axis.setLabelFont(new Font("宋体",Font.BOLD,22));  //设置X轴坐标上标题的文字
        axis.setLabelPaint(Color.BLACK);
        axis.setTickLabelFont(new Font("宋体",Font.BOLD,15));  //设置X轴坐标上的文字
        axis.setTickLabelPaint(Color.BLACK);

        //2. 图形Y轴坐标文字的设置
        ValueAxis valueAxis = plot.getRangeAxis();
        valueAxis.setLabelFont(new Font("宋体",Font.BOLD,15));  //设置Y轴坐标上标题的文字
        valueAxis.setLabelPaint(Color.BLACK);
        valueAxis.setTickLabelFont(new Font("sans-serif",Font.BOLD,12));//设置Y轴坐标上的文字
        valueAxis.setTickLabelPaint(Color.BLACK);
    }

    // 获取一个演示用的组合数据集对象
    private CategoryDataset getDataSetYear() {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        //获取信息
        Object obj1=session.getAttribute("yearl");
        Object obj2=session.getAttribute("cnty");
        List<String>yearl=new ArrayList<>();
        List<Integer>cnty=new ArrayList<>();
        for (Object o: (List<?>) obj1){ yearl.add(String.class.cast(o)); }
        for (Object o: (List<?>) obj2){ cnty.add(Integer.class.cast(o)); }
        for (int i = 0; i < ((List<?>) obj1).size(); i++) { dataset.addValue(cnty.get(i),"",yearl.get(i)); }
//        dataset.addValue(40, "", "普通动物学");
//        dataset.addValue(50, "", "生物学");
//        dataset.addValue(60, "", "动物解剖学");
//        dataset.addValue(70, "", "生物理论课");
//        dataset.addValue(80, "", "动物理论课");
        return dataset;
    }
    private CategoryDataset getDataSetMon() {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        //获取信息
        Object obj3=session.getAttribute("monl");
        Object obj4=session.getAttribute("cntm");
        List<String> monl=new ArrayList<>();
        List<Integer>cntm=new ArrayList<>();
        for (Object o: (List<?>) obj3){ monl.add(String.class.cast(o)); }
        for (Object o: (List<?>) obj4){ cntm.add(Integer.class.cast(o)); }
//        for (int cnt:cntm){ System.out.println(" "+cnt);}
        for (int i = 0; i < ((List<?>) obj3).size(); i++) { dataset.addValue(cntm.get(i),"",monl.get(i)); }

//        dataset.addValue(40, "", "普通动物学");
//        dataset.addValue(50, "", "生物学");
//        dataset.addValue(60, "", "动物解剖学");
//        dataset.addValue(70, "", "生物理论课");
//        dataset.addValue(80, "", "动物理论课");
        return dataset;
    }

    @RequestMapping(params = "method=Year")
    public ModelAndView Year(HttpServletRequest request,HttpServletResponse response, ModelMap modelMap) throws Exception{
        //1. 获得数据集合
        CategoryDataset dataset = getDataSetYear();
        JFreeChart chart = ChartFactory.createLineChart("年度借阅柱状图", // 图表标题

               "年份", // 目录轴的显示标签
               "次数", // 数值轴的显示标签
               dataset, // 数据集
               PlotOrientation.VERTICAL, // 图表方向：水平、垂直
               false, // 是否显示图例(对于简单的柱状图必须是false)
               true, // 是否生成工具
               true // 是否生成URL链接
                  );

          //3. 设置整个柱状图的颜色和文字（char对象的设置是针对整个图形的设置）
//        chart.setBackgroundPaint(ChartColor.WHITE); // 设置总的背景颜色
//        chart.getLegend(0).setItemFont(new Font("宋体",Font.BOLD,20));
//        chart.getLegend(0).setItemPaint(Color.BLUE);

        //4. 获得图形对象，并通过此对象对图形的颜色文字进行设置
        CategoryPlot p = chart.getCategoryPlot();// 获得图表对象
        p.setNoDataMessage("当前没有数据统计！");
        p.setNoDataMessagePaint(Color.RED);
        p.setNoDataMessageFont(new Font("宋体",Font.BOLD,20));
        p.setBackgroundPaint(ChartColor.WHITE);//图形背景颜色
        p.setRangeGridlinePaint(ChartColor.DARK_GREEN);//图形表格颜色
        p.setDomainGridlinesVisible(true);  //设置背景网格线是否可见
        p.setDomainGridlinePaint(Color.GRAY); //设置背景竖网格线颜色
        p.setRangeGridlinePaint(Color.GRAY); //设置背景横网格线颜色

        //显示节点数据
//        LineAndShapeRenderer renderer = (LineAndShapeRenderer) p.getRenderer();
//        renderer.setBaseItemLabelsVisible(true);
//        renderer.setBaseShapesFilled(true);
//        renderer.setBaseItemLabelsVisible(true);
//        renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
//        renderer.setBaseItemLabelFont(new Font("Dialog", 1, 14));
//        p.setRenderer(renderer);

        //5.解决乱码问题
        getChartByFont(chart);

        //6. 将图形转换为图片，传到前台
        String fileName = ServletUtilities.saveChartAsJPEG(chart, 700, 400, null, request.getSession());
        String chartURL=request.getContextPath() + "/chart?filename="+fileName;
        modelMap.put("chartURL", chartURL);
        return new ModelAndView("anual",modelMap);
    }


    @RequestMapping(params = "method=Mon")
    public ModelAndView Mon(HttpServletRequest request,HttpServletResponse response, ModelMap modelMap) throws Exception{
        //1. 获得数据集合
        CategoryDataset dataset = getDataSetMon();
        JFreeChart chart = ChartFactory.createLineChart("年度借阅柱状图", // 图表标题

                "年份", // 目录轴的显示标签
                "次数", // 数值轴的显示标签
                dataset, // 数据集
                PlotOrientation.VERTICAL, // 图表方向：水平、垂直
                false, // 是否显示图例(对于简单的柱状图必须是false)
                true, // 是否生成工具
                true // 是否生成URL链接
        );

        //3. 设置整个柱状图的颜色和文字（char对象的设置是针对整个图形的设置）
//        chart.setBackgroundPaint(ChartColor.WHITE); // 设置总的背景颜色
//        chart.getLegend(0).setItemFont(new Font("宋体",Font.BOLD,20));
//        chart.getLegend(0).setItemPaint(Color.BLUE);

        //4. 获得图形对象，并通过此对象对图形的颜色文字进行设置
        CategoryPlot p = chart.getCategoryPlot();// 获得图表对象
        p.setNoDataMessage("当前没有数据统计！");
        p.setNoDataMessagePaint(Color.RED);
        p.setNoDataMessageFont(new Font("宋体",Font.BOLD,20));
        p.setBackgroundPaint(ChartColor.WHITE);//图形背景颜色
        p.setRangeGridlinePaint(ChartColor.DARK_GREEN);//图形表格颜色
        p.setDomainGridlinesVisible(true);  //设置背景网格线是否可见
        p.setDomainGridlinePaint(Color.GRAY); //设置背景竖网格线颜色
        p.setRangeGridlinePaint(Color.GRAY); //设置背景横网格线颜色

        //显示节点数据
        LineAndShapeRenderer renderer = (LineAndShapeRenderer) p.getRenderer();
//        renderer.setBaseItemLabelsVisible(true);
//        renderer.setBaseShapesFilled(true);
//        renderer.setBaseItemLabelsVisible(true);
//        renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
//        renderer.setBaseItemLabelFont(new Font("Dialog", 1, 14));
//        p.setRenderer(renderer);

        //5.解决乱码问题
        getChartByFont(chart);

        //6. 将图形转换为图片，传到前台
        String fileName = ServletUtilities.saveChartAsJPEG(chart, 700, 400, null, request.getSession());
        String chartURL=request.getContextPath() + "/chart?filename="+fileName;
        modelMap.put("chartURL", chartURL);
        return new ModelAndView("anual",modelMap);
    }
}