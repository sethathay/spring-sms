package com.tax.springsms;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.krysalis.barcode4j.impl.code128.Code128Bean;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;



/**
 * Servlet implementation class Create_Bar_Code
 */
//@WebServlet("/Create_Bar_Code_With_Parameter")
@Controller
public class Create_Bar_Code_With_Parameter extends HttpServlet{
	private static final long serialVersionUID = 1L;
    /**
     * Default constructor. 
     */
    public Create_Bar_Code_With_Parameter() {
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @GetMapping("/Create_Bar_Code_With_Parameter")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String value=request.getParameter("value");
		response.setContentType("image/jpg");
        Code128Bean code128 = new Code128Bean();
		code128.setHeight(15f);
		code128.setModuleWidth(0.3);
		code128.setQuietZone(10);
		code128.doQuietZone(true);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		BitmapCanvasProvider canvas = new BitmapCanvasProvider(baos, "image/x-png", 300, BufferedImage.TYPE_BYTE_BINARY, false, 0);
		code128.generateBarcode(canvas, value);
		canvas.finish();
        ServletOutputStream responseOutputStream = response.getOutputStream();
        responseOutputStream.write(baos.toByteArray());
        responseOutputStream.flush();
        responseOutputStream.close();
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}
