var images = ["pdf_img/0.png", "pdf_img/1.png", "pdf_img/2.png"]; // Add paths to your images here
var currentIndex = 0;

function nextImage() {
    alert("aa");
    currentIndex = (currentIndex + 1) % images.length;
    var xhr = new XMLHttpRequest();
    var url = "http://localhost:8084/Control_Laptop_Mouse_Music_Presentation/get_slide_number"; // Replace this with the URL of your servlet

    xhr.open("GET", url, true);

    // Set up the callback function to handle the response
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // Request was successful, you can handle the response here
            alert(xhr.responseText);
        } else {
            // Handle any errors here
            alert("Error occurred while calling the servlet.");
        }
    };

    xhr.send();
    alert(currentIndex);
    currentIndex++;
    document.getElementById("fullscreen-img").src ="pdf_img/"+currentIndex+".png";// images[currentIndex];
}
