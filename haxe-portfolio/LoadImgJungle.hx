import js.Browser;
import js.html.ButtonElement;
import js.html.ImageElement;
import js.html.DivElement;
import js.html.KeyboardEvent;

class LoadImgJungle {
    static var images = [
        { url: "../img/cheetah.jpg", title: "Cheetah" },
        { url: "../img/chimp.jpg", title: "Chimpanzee" },
        { url: "../img/elephant.jpg", title: "Elephant - 1" },
        { url: "../img/elephant-2.jpg", title: "Elephant - 2" },
        { url: "../img/elephant-3.jpg", title: "Elephant - 3" },
        { url: "../img/elephant-4.jpg", title: "Elephant - 4" },
        { url: "../img/elephant5.jpg", title: "Elephant - 5" },
        { url: "../img/elephant6.jpg", title: "Elephant - 6" },
        { url: "../img/giraffe.jpg", title: "Giraffe - 1" },
        { url: "../img/giraffe1.jpg", title: "Giraffe - 2" },
        { url: "../img/leopard.jpg", title: "Leopard - 1" },
        { url: "../img/leopard1.jpg", title: "Leopard - 2" },
        { url: "../img/lima.jpg", title: "Lima - 1" },
        { url: "../img/lima1.jpg", title: "Lima - 2" },
        { url: "../img/lion.jpg", title: "Lion - 1" },
        { url: "../img/lion1.jpg", title: "Lion - 2" },
        { url: "../img/panda.jpg", title: "Panda - 1" },
        { url: "../img/rhino.jpg", title: "Rhino's Stare" },
        { url: "../img/rhino-2.jpg", title: "Rhino Running" },
        { url: "../img/tiger.jpg", title: "Friendly Tiger" },
        { url: "../img/tiger-2.jpg", title: "Fierce Tiger" }
    ];

    static var index:Int = 0;

    // Swipe/drag tracking
    static var startX:Float = 0;
    static var endX:Float = 0;
    static var dragging:Bool = false;

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

        // ---------------------------------------------------------
        // TOUCH SWIPE SUPPORT
        // ---------------------------------------------------------
        artwork.addEventListener("touchstart", function(e) {
            startX = e.touches[0].clientX;
            dragging = true;
        });

        artwork.addEventListener("touchmove", function(e) {
            if (dragging) endX = e.touches[0].clientX;
        });

        artwork.addEventListener("touchend", function(e) {
            if (dragging) {
                dragging = false;
                handleSwipe(artwork, title);
            }
        });

        // ---------------------------------------------------------
        // MOUSE DRAG SUPPORT (Desktop)
        // ---------------------------------------------------------
        artwork.addEventListener("mousedown", function(e) {
            startX = e.clientX;
            dragging = true;
        });

        Browser.document.addEventListener("mousemove", function(e) {
            if (dragging) endX = e.clientX;
        });

        Browser.document.addEventListener("mouseup", function(e) {
            if (dragging) {
                dragging = false;
                handleSwipe(artwork, title);
            }
        });

        fadeUpdate(artwork, title);
    }

    // ---------------------------------------------------------
    // SWIPE HANDLER
    // ---------------------------------------------------------
    static function handleSwipe(artwork:ImageElement, title:DivElement):Void {
        var diff = endX - startX;
        var threshold = 50; // Minimum swipe distance

        if (Math.abs(diff) < threshold) return;

        if (diff < 0) {
            // Swipe left → next
            index = (index + 1) % images.length;
        } else {
            // Swipe right → previous
            index = (index - 1 + images.length) % images.length;
        }

        fadeUpdate(artwork, title);
    }

    // ---------------------------------------------------------
    // FADE + IMAGE UPDATE
    // ---------------------------------------------------------
    static function fadeUpdate(artwork:ImageElement, title:DivElement) {
        artwork.classList.add("fade-out");

        Browser.window.setTimeout(function() {
            artwork.src = images[index].url;
            title.innerText = images[index].title;

            artwork.onload = function(_) {
                var w = artwork.naturalWidth;
                var h = artwork.naturalHeight;

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