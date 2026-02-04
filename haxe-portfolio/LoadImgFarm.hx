
import js.Browser;
import js.html.ButtonElement;
import js.html.ImageElement;
import js.html.DivElement;
import js.html.KeyboardEvent;
import js.html.Console;

class LoadImgFarm {
    static var images = [
        { url: "../img/cow.jpg", title: "Cow - 1"},
        { url: "../img/cow1.jpg", title: "Cow - 2" },
        { url: "../img/donkey.jpg", title: "Donkey - 1" },
        { url: "../img/donkey1.jpg", title: "Donkey - 2" },
        {url: "../img/donkey2.jpg", title: "Donkey - 3" },
        { url: "../img/donkey3.jpg", title: "Donkey - 4" },
        { url: "../img/pig.jpg", title: "Pig" },
        { url: "../img/pigs.jpg", title: "Pigs" }
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