<%@ page language="java" pageEncoding="utf-8" contentType="text/xml"%>

<%
String scheme=request.getScheme()+"://";  //scheme:http://
String header  =request.getHeader("host");  //header:localhost:8080
String contextPath = request.getContextPath();  //contextPath:/dlg2012

String requestURI=request.getRequestURI();  //requestURI:/dlg2012/crest/jsp/index.jsp
String curUrl = scheme+header+contextPath+"/app";
%>
<Piecemaker>
  <Contents>
  	<Image Source="<%=curUrl%>/lc/display/resources/js/index/contents/piecemaker1.png" Title="1">
  		<Hyperlink URL="<%=curUrl%>/lc/display/jsp/main.jsp?menu=1" Target="_blank" />
  	</Image>
   
    <Image Source="<%=curUrl%>/lc/display/resources/js/index/contents/piecemaker3.png" Title="2">
    	<Hyperlink URL="<%=curUrl%>/lc/display/jsp/main.jsp?menu=1" Target="_blank" />
    </Image>
    <Image Source="<%=curUrl%>/lc/display/resources/js/index/contents/piecemaker4.png" Title="3">
    	<Hyperlink URL="<%=curUrl%>/lc/display/jsp/main.jsp?menu=1" Target="_blank" />
    </Image>
    <!--  
    <Image Source="<%=curUrl%>/lc/display/resources/js/index/contents/piecemaker1.png" Title="The Piecemaker 2">
      <Hyperlink URL="<%=curUrl%>/lc/display/jsp/main.jsp?menu=1" Target="_blank" />
    </Image>
    <Image Source="<%=curUrl%>/lc/display/resources/js/index/contents/piecemaker2.png" Title="Lots of new Features">
	  <Text>&lt;h1&gt;welcome to china unicom&lt;/h1&gt;</Text>
      <Hyperlink URL="<%=curUrl%>/lc/display/jsp/main.jsp?menu=1" Target="_blank" />
    </Image>
    <Flash Source="<%=curUrl%>/lc/display/resources/js/index/contents/flash.swf" Title="Loaded SWF File">
      <Image Source="<%=curUrl%>/lc/display/resources/js/index/contents/flash-preview.png" />
    </Flash>
    <Image Source="<%=curUrl%>/lc/display/resources/js/index/contents/piecemaker3.png" Title="Editing made Easy"></Image>
    <Video Source="<%=curUrl%>/lc/display/resources/js/index/contents/video.mp4" Title="Video Example" Width="910" Height="365" Autoplay="true">
      <Image Source="<%=curUrl%>/lc/display/resources/js/index/contents/video-preview.jpg" />
    </Video>
    -->
  </Contents>
  <Settings ImageWidth="900" ImageHeight="360" LoaderColor="0x333333" InnerSideColor="0x222222" SideShadowAlpha="0.8" DropShadowAlpha="0.7" DropShadowDistance="25" DropShadowScale="0.95" DropShadowBlurX="40" DropShadowBlurY="4" MenuDistanceX="20" MenuDistanceY="50" MenuColor1="0x999999" MenuColor2="0x333333" MenuColor3="0xFFFFFF" ControlSize="100" ControlDistance="20" ControlColor1="0x222222" ControlColor2="0xFFFFFF" ControlAlpha="0.8" ControlAlphaOver="0.95" ControlsX="450" ControlsY="280&#xD;&#xA;" ControlsAlign="center" TooltipHeight="30" TooltipColor="0x222222" TooltipTextY="5" TooltipTextStyle="P-Italic" TooltipTextColor="0xFFFFFF" TooltipMarginLeft="5" TooltipMarginRight="7" TooltipTextSharpness="50" TooltipTextThickness="-100" InfoWidth="400" InfoBackground="0xFFFFFF" InfoBackgroundAlpha="0.95" InfoMargin="15" InfoSharpness="0" InfoThickness="0" Autoplay="10" FieldOfView="45"></Settings>
  <Transitions>
    <Transition Pieces="9" Time="1.2" Transition="easeInOutBack" Delay="0.1" DepthOffset="300" CubeDistance="30"></Transition>
    <Transition Pieces="15" Time="3" Transition="easeInOutElastic" Delay="0.03" DepthOffset="200" CubeDistance="10"></Transition>
    <Transition Pieces="5" Time="1.3" Transition="easeInOutCubic" Delay="0.1" DepthOffset="500" CubeDistance="50"></Transition>
    <Transition Pieces="9" Time="1.25" Transition="easeInOutBack" Delay="0.1" DepthOffset="900" CubeDistance="5"></Transition>
  </Transitions>
</Piecemaker>