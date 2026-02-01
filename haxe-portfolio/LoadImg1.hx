
import js.Browser;
import js.html.ButtonElement;
import js.html.ImageElement;
import js.html.DivElement;
import js.html.KeyboardEvent;
import js.html.Console;

class LoadImg {
    static var images = [
        { url: "img/artist.jpg", title: "Bailey and I welcome you to my portfolio" },
        { url: "img/bailey-playing.jpg", title: "Bailey at Play" },
        { url: "img/cheetah.jpg", title: "Cheetah" },
        { url: "img/chimp.jpg", title: "Chimpanzee" },
        { url: "img/elephant.jpg", title: "Elephant's Stare" },
        { url: "img/elephant-2.jpg", title: "Elephant Running" },
        { url: "img/giraffe.jpg", title: "Giraffe" },
        { url: "img/lion.jpg", title: "Lion" },
        { url: "img/rhino.jpg", title: "Rhino's Stare" },
        { url: "img/rhino-2.jpg", title: "Rhino Running" },
        { url: "img/tiger.jpg", title: "Friendly Tiger" },
        { url: "img/tiger-2.jpg", title: "Fierce Tiger" }
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
        // After fade-out completes, change image and fade back in
        Browser.window.setTimeout(function() {
            artwork.src = images[index].url; 
            title.innerText = images[index].title;
            artwork.classList.remove("fade-out");
        }, 300); // slightly shorter than CSS transition for smoothness
    }
}