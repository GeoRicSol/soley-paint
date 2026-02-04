
import js.Browser;
import js.html.ButtonElement;
import js.html.ImageElement;
import js.html.DivElement;
import js.html.KeyboardEvent;
import js.html.Console;

class LoadImgHorse {
    static var images = [
        { url: "../img/horse1.jpg", title: "Horse - 1" },
        { url: "../img/horse2.jpg", title: "Horse - 2" },
        { url: "../img/horse3.jpg", title: "Horse - 3" },
        { url: "../img/horse4.jpg", title: "Horse - 4" },
        { url: "../img/horse5.jpg", title: "Horse - 5" },
        { url: "../img/horse6.jpg", title: "Horse - 6" },
        { url: "../img/horse7.jpg", title: "Horse - 7" },
        { url: "../img/horse8.jpg", title: "Horse - 8" },
        { url: "../img/horse9.jpg", title: "Horse - 9" },
        { url: "../img/horse10.jpg", title: "Horse - 10" },
        { url: "../img/horse11.jpg", title: "Horse - 11" },
        { url: "../img/horse12.jpg", title: "Horse - 12" },
        { url: "../img/horse13.jpg", title: "Horse - 13" },
        { url: "../img/horse14.jpg", title: "Horse - 14" }
    ];

    static var index:Int = 0;

    static function main() {
        var artwork:ImageElement = cast Browser.document.getElementById("artwork");
        var title:DivElement = cast Browser.document.getElementById("title");
        
        var btn1:ButtonElement = cast Browser.document.getElementById("btn1");
        var btn2:ButtonElement = cast Browser.document.getElementById("btn2");
        var btn3:ButtonElement = cast Browser.document.getElementById("btn3");
        var btn4:ButtonElement = cast Browser.document.getElementById("btn4");

        btn1.onclick = function(_) {
            index = 0;
            fadeUpdate(artwork, title);
        };

        btn2.onclick = function(_) {
            index = (index - 1 + images.length) % images.length;
            fadeUpdate(artwork, title);
        };

        btn3.onclick = function(_) {
            index = (index + 1) % images.length;
            fadeUpdate(artwork, title);
        };

        btn4.onclick = function(_) {
            index = images.length - 1;
            fadeUpdate(artwork, title);
        };

        // Keyboard navigation
        Browser.document.onkeydown = function(e:KeyboardEvent) {
            switch (e.key) {
                case "ArrowLeft":
                    index = (index - 1 + images.length) % images.length;
                    fadeUpdate(artwork, title);
                case "ArrowRight":
                    index = (index + 1) % images.length;
                    fadeUpdate(artwork, title);
                case "Home":
                    index = 0;
                    fadeUpdate(artwork, title);
                case "End":
                    index = images.length - 1;
                    fadeUpdate(artwork, title);
                default:
            }
        };

        fadeUpdate(artwork, title);
    }

    static function fadeUpdate(artwork:ImageElement, title:DivElement) {
    // Start fade-out
    artwork.classList.add("fade-out");

    Browser.window.setTimeout(function() {
        artwork.src = images[index].url;
        title.innerText = images[index].title;

        // Wait for the new image to fully load
        artwork.onload = function(_) {
            var w = artwork.naturalWidth;
            var h = artwork.naturalHeight;

            // If height > 2 × width → tall image
            if (h > 2 * w) {
                artwork.style.width = "auto";
                artwork.style.height = "600px";
            } else {
                artwork.style.width = "88%";
                artwork.style.height = "auto";
            }
        };

        artwork.classList.remove("fade-out");
    }, 300);
}
}