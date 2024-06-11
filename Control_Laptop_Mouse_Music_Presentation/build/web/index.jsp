<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Presentation</title>
    <link rel="stylesheet" href="styles.css">
    <script>
        function nextImage1() {
   // alert("aa");
    //currentIndex = (currentIndex + 1) % images.length;
    var xhr = new XMLHttpRequest();
    var url = "http://localhost:8084/Control_Laptop_Mouse_Music_Presentation/get_slide_number"; // Replace this with the URL of your servlet

    xhr.open("GET", url, true);

    // Set up the callback function to handle the response
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
          //  alert(xhr.responseText);
            document.getElementById("fullscreen-img").src ="pdf_img/"+xhr.responseText+".png";
            // Request was successful, you can handle the response here
           // 
//            if(xhr.responseText=="next" || xhr.responseText=="right")
//            {
//                currentIndex++;
//                document.getElementById("fullscreen-img").src ="pdf_img/"+currentIndex+".png";
//            }
//            else if(xhr.responseText=="prev" || xhr.responseText=="left")
//            {
//                if (currentIndex==0)
//                {
//                    currentIndex=0;
//                }
//                else{
//                currentIndex--;
//            }
//                document.getElementById("fullscreen-img").src ="pdf_img/"+currentIndex+".png";
//            }
        } else {
            // Handle any errors here
         //   alert("Error occurred while calling the servlet.");
        }
    };

    xhr.send();
   // alert(currentIndex);
   // currentIndex++;
   // document.getElementById("fullscreen-img").src ="pdf_img/"+currentIndex+".png";// images[currentIndex];
}


// var xhr = new XMLHttpRequest();
//    var url = "http://localhost:8084/Control_Laptop_Mouse_Music_Presentation/get_slide_number"; // Replace this with the URL of your servlet
//
//    xhr.open("GET", url, true);
//
//    // Set up the callback function to handle the response
//    xhr.onreadystatechange = function () {
//        if (xhr.readyState === 4 && xhr.status === 200) {
//            // Request was successful, you can handle the response here
//         currentIndex=   xhr.responseText;
//         //alert(xhr.responseText);
////            if(xhr.responseText=="right")
////            {
//               // currentIndex++;
//                document.getElementById("fullscreen-img").src ="pdf_img/"+currentIndex+".png";
////            }
////            else if(xhr.responseText=="left")
////            {
////                if (currentIndex==0)
////                {
////                    currentIndex=0;
////                }
////                else{
////                currentIndex--;
////            }
////                document.getElementById("fullscreen-img").src ="pdf_img/"+currentIndex+".png";
////            }
//        } else {
//            // Handle any errors here
//         //   alert("Error occurred while calling the servlet.");
//        }
//    };
//
//    xhr.send();
//window.setTimeout( function() {
//  window.location.reload();
//}, 3000);
setInterval(nextImage1, 2000);
    </script>
        
</head>
<body>
    <div class="fullscreen-image">
        <img id="fullscreen-img" src="pdf_img/0.png" alt="Full Screen Image">
        <button id="next-btn" onclick="nextImage1()">Next Image</button>
    </div>

    <script src="script.js"></script>
</body>
</html>
