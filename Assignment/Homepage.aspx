<%@ Page Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="OnlineAssessementSite.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="CSS/Icon.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
body, html {
    height: 100%;
    line-height: 1.8;
}
/* Full height image header */
.bgimg-4 {
    background-position: center;
    background-size: cover;
    background-image: url("/Image/background13.jpg");
    min-height: 100%;
}
.w3-bar .w3-button {
    padding: 16px;
}
/*background*/
.bgimg-1, .bgimg-2, .bgimg-3 {
  position: relative;
  opacity: 0.65;
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;

}
.bgimg-1 {
  background-image: url("/Image/background9.png");
  min-height: 100%;
}

.bgimg-2 {
  background-image: url("/Image/background14.jpg");
  min-height: 400px;
}

.bgimg-3 {
  background-image: url("/Image/background19.png");
  min-height: 400px;
}

.caption {
  position: absolute;
  left: 0;
  top: 50%;
  width: 100%;
  text-align: center;
  color: #000;
}

.caption span.border {
  background-color: #111;
  color: #fff;
  padding: 18px;
  font-size: 25px;
  letter-spacing: 10px;
}

h3 {
  letter-spacing: 5px;
  text-transform: uppercase;
  font: 20px "Lato", sans-serif;
  color: #111;
}

/* Turn off parallax scrolling for tablets and phones */
@media only screen and (max-device-width: 1024px) {
    .bgimg-1, .bgimg-2, .bgimg-3 {
        background-attachment: scroll;
    }
}

/*automated slide show*/
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}


    .auto-style1 {
        left: 0%;
        top: 1700%;
    }


</style>

<!-- Header with full-height image -->
<header class="bgimg-4 w3-display-container w3-grayscale-min" id="home">
   
    


<!-- About Section -->
<div class="w3-container" style="padding:128px 16px" id="about">

    
  <div class="auto-style1" style="padding:48px">
      
    <span class="w3-jumbo w3-animate-top">Welcome to Caring Wow Assessment Site</span><br>
    <span class="w3-xxlarge w3-hide-large w3-hide-medium  ">Where the education journey begins</span><br>
    <span class="w3-large">We cares about your education</span>
    <p><asp:Button ID="Button1" runat="server" class="w3-button w3-grey w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-off" Text ="Learn more and start today" OnClick="Button1_Click" />
</p>
    
  </div>

</div> 
 </header>
  

     
  

    <div class="w3-container" style="padding:128px 16px" id="about">
    <h3 class="w3-center ">ABOUT THE CARING WOW SITE</h3>
  <p class="w3-center w3-large">Key features of our assessmsnt site</p>

<div class="w3-row-padding w3-center" style="margin-top:64px">
    <div class="w3-quarter">
      <i class="fa fa-desktop w3-margin-bottom w3-jumbo w3-center"></i>
      <p class="w3-large">Responsive</p>
      <p>The dynamic website will provide you with the most cutting edge browsing experience so that you can have no worries during assessment!</p>
    </div>
    <div class="w3-quarter">
      <i class="fa fa-heart w3-margin-bottom w3-jumbo"></i>
      <p class="w3-large">Passion</p>
      <p>Passion is everthing! Our stunning webosite will just makes you fall in love with your subjects!</p>
    </div>
    <div class="w3-quarter">
      <i class="fa fa-child w3-margin-bottom w3-jumbo"></i>
      <p class="w3-large">Supportive</p>
      <p>The wesite is supported by Google Chrome, Fire Fox, Internet Explorer which provide the same seamless experience!</p>
    </div>
    <div class="w3-quarter">
      <i class="fa fa-mortar-board w3-margin-bottom w3-jumbo"></i>
      <p class="w3-large">Graduade Garuantee</p>
      <p>The informative website will provide everthing you need to further gradueate.</p>
    </div>
  </div>
        </div>
   

<!-- Promo Section - "We know design" -->
<div class="bgimg-2" style="padding:128px 16px">
 
  <div class="w3-row-padding" >
    <div class="w3-col m6">
      <h3>"Life is like riding bicycle</h3>
      <p>to keep your balance, you must keep riding"-Thomas Edison</p>
     
    </div>
    
  </div>
</div>

<!-- Assessment -->
<div class="w3-container" style="padding:128px 16px" id="team">
  <h3 class="w3-center">COURSE INFORMATION</h3>
  <p class="w3-center w3-large">ASSESSMENT QUESTIONS</p>
  <div class="w3-row-padding w3-grayscale" style="margin-top:64px">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
       
        <div class="w3-container">
          <h3>BACS2042</h3>
          <p class="w3-opacity">Research Method</p>
          <p>Research methods refers to the tools that one uses to do research. These can either be qualitative or quantitative or mixed. Quantitative methods examines numerical data and often requires the use of statistical tools to analyse data collected.</p>
          
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
       
        <div class="w3-container">
          <h3>BACS2073</h3>
          <p class="w3-opacity">Software Design and Architecture</p>
          <p>In the Software Design and Architecture Specialization, you will learn how to create reusable and flexible software applications and systems. You will learn how to express and document the design and architecture of a software system.</p>
          
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
        
        <div class="w3-container">
          <h3>BACS2083</h3>
          <p class="w3-opacity">Formal Method for Software Engineering</p>
          <p>In software development, formal methods are mathematical approaches to solving software (and hardware) problems at the requirements, specification, and design levels. Formal methods are most likely to be applied to safety.</p>
          
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
       
        <div class="w3-container">
          <h3>BACS3183</h3>
          <p class="w3-opacity">Advance Database Management</p>
          <p>The systems designed to make easier the management of the databases is called database management systems. The database management systems are used for recording, storage, and management of the data in a database.</p>
          
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Promo Section "Statistics" -->
<div class="bgimg-1 w3-container w3-row w3-center w3-dark-grey w3-padding-64">
  <div class="w3-quarter">
    <span class="w3-xxlarge">14+</span>
    <br>Lectures
  </div>
  <div class="w3-quarter">
    <span class="w3-xxlarge">55+</span>
    <br>Questions Sets
  </div>
  <div class="w3-quarter">
    <span class="w3-xxlarge">387+</span>
    <br>Happy Candidates
  </div>
  <div class="w3-quarter">
    <span class="w3-xxlarge">150+</span>
    <br>Employment
  </div>
</div>

<!-- Work Section -->
<div class="w3-container" style="padding:128px 16px" id="work">
  <div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="/Image/student4.jpg" style="width:100%">
 
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="/Image/student2.jpg" style="width:100%">
  
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="/Image/student.jpg" style="width:100%">
 
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
</div>

<!-- Modal for full size images on click-->
<div id="modal01" class="w3-modal w3-black" onclick="this.style.display='none'">
  <span class="w3-button w3-xxlarge w3-black w3-padding-large w3-display-topright" title="Close Modal Image">×</span>
  <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
    <img id="img01" class="w3-image">
    <p id="caption" class="w3-opacity w3-large"></p>
  </div>
</div>





<!-- Contact -->
 
<div class=" w3-padding-64 w3-grayscale-min w3-large bgimg-3" id="contact">
  <div class="w3-content">
    <h1 class="w3-center w3-xxlarge" style="margin-bottom:64px">Contact Us</h1>
    <p>Find us by filling the form below or call us at 012-5543223</p>
    <p><span class="w3-tag">FYI!</span>We provide in-depth consultation regarding course information.</p>
    <p class="w3-large"><strong>Call us</strong>, ask for anything in mind or just send us a message:</p>

     <div class="w3-input w3-padding-10 w3-border"> 
         <table style="width: 100%;">
             <tr>
                 <td><asp:Label ID="Label1" runat="server" Text="Name"></asp:Label></td>
                 <td><asp:TextBox ID="TextBox1" runat="server" Width="300px"  ></asp:TextBox></td>
                
             </tr>
             <tr>
                 <td> <asp:Label ID="Label2" runat="server" Text="E-mail"></asp:Label></td>
                 <td><asp:TextBox ID="TextBox2" runat="server" Width="300px"  ></asp:TextBox></td>
                 
             </tr>
             <tr>
                 <td><asp:Label ID="Label3" runat="server" Text="Contact Number"></asp:Label></td>
                 <td><asp:TextBox ID="TextBox3" runat="server" Width="300px"  ></asp:TextBox></td>
                 
             </tr>
             <tr>
                 <td> <asp:Label ID="Label4" runat="server" Text="Message"></asp:Label></td>
                 <td> <asp:TextBox ID="TextBox4" runat="server" Height="112px" Width="300px"  ></asp:TextBox></td>
             </tr>
         </table>
       
        
        <asp:Button ID="Button2" runat="server"  class="w3-button w3-light-grey w3-block" Text ="SEND MESSAGE" OnClick="Button1_Click" />
     
      
    </div>
  </div>
</div>


 
<script>
// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}


// Toggle between showing and hiding the sidebar when clicking the menu icon
var mySidebar = document.getElementById("mySidebar");

function w3_open() {
    if (mySidebar.style.display === 'block') {
        mySidebar.style.display = 'none';
    } else {
        mySidebar.style.display = 'block';
    }
}

// Close the sidebar with the close button
function w3_close() {
    mySidebar.style.display = "none";
    }

    //slides
    
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}

</script>
</asp:Content>
