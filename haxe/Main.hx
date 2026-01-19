import js.Browser;
import js.html.*;

class Main {
    static function main() {
        // Create <select> element
        var select = Browser.document.createSelectElement();
        select.id = "videoSelector";

        var selectBS = Browser.document.createSelectElement();
        selectBS.id = "videoSelectorBS";

        var selectBrS = Browser.document.createSelectElement();
        selectBrS.id = "videoSelectorBrS";

        var selectFC = Browser.document.createSelectElement();
        selectFC.id = "videoSelectorFC";

        var aboutScrn = Browser.document.createSelectElement();
        aboutScrn.id = "aboutScrn";

        // List of Aqua video sources
        var videos = [
            { label: "Early Beginners", src: "" },
            { label: "Aqua Mobile 2", src: "videos/aqua-mobile-2.mp4" },
            { label: "Aqua Mobile 3", src: "videos/aqua-mobile-3.mp4" },
            { label: "Aqua Mobile 4", src: "videos/aqua-mobile-4.mp4" },
            { label: "Aqua Mobile 5", src: "videos/aqua-mobile-5.mp4" },
            { label: "Aqua Mobile 6", src: "videos/aqua-mobile-6.mp4" },
            { label: "Floating on Back", src: "videos/floating-back.mp4" },
            { label: "Blippi 1", src: "videos/blippi-part1.mp4" },
            { label: "Blippi 2", src: "videos/blippi-part2.mp4" },
            { label: "Finny the Shark", src: "videos/finny-the-shark.mp4" }
        ];

         // List of Backstroke video sources
        var videosBS = [
            { label: "Back Stroke", src: "" },
            { label: "Back Stroke 1", src: "videos/backstroke-1.mp4" },
            { label: "Back Stroke 2", src: "videos/backstroke-2.mp4" },
            { label: "Back Stroke 3", src: "videos/backstroke-3.mp4" }
        ];

         // List of Backstroke video sources
        var videosBrS = [
            { label: "Breast Stroke", src: "" },
            { label: "Breast Stroke Kick", src: "videos/breaststroke-kick.mp4" },
            { label: "Breast Stroke - Full", src: "videos/breaststroke.mp4" }
        ];

 // List of Backstroke video sources
        var videosFC = [
            { label: "Front Crawl", src: "" },
            { label: "Front Crawl - Arms", src: "videos/frontcrawl-arms.mp4" },
            { label: "Front Crawl - Breathing", src: "videos/frontcrawl-breathing.mp4" },
            { label: "Front Crawl - Legs", src: "videos/frontcrawl-legs.mp4" },
            { label: "Front Crawl - Legs 1", src: "videos/frontcrawl-legs-1.mp4" },
            { label: "Front Crawl - Full", src: "videos/frontcrawl-full.mp4" },
        ];

        // Populate dropdown
        for (v in videos) {
            var opt = Browser.document.createOptionElement();
            opt.text = v.label;
            opt.value = v.src;
            select.appendChild(opt);
        }
        
        // Populate dropdown
        for (v in videosBS) {
            var opt = Browser.document.createOptionElement();
            opt.text = v.label;
            opt.value = v.src;
            selectBS.appendChild(opt);
        }

        // Populate breast stroke dropdown
        for (v in videosBrS) {
            var opt = Browser.document.createOptionElement();
            opt.text = v.label;
            opt.value = v.src;
            selectBrS.appendChild(opt);
        }

        
        // Populate front crawl dropdown
        for (v in videosFC) {
            var opt = Browser.document.createOptionElement();
            opt.text = v.label;
            opt.value = v.src;
            selectFC.appendChild(opt);
        }

        var optAbout = Browser.document.createOptionElement();
        optAbout.text = "Welcome";
        optAbout.value = "";
        aboutScrn.appendChild(optAbout);

        var br = Browser.document.createElement("br");

        // Create <video> element
        var video = Browser.document.createVideoElement();
        video.id = "player";
        video.controls = true;
        video.width = 640;
        video.height = 360;

        // Set initial source
        video.src = videos[0].src;

                // Change handler
        aboutScrn.onclick = function(_) {
            Browser.window.alert("If you are looking at this web page you are most likely interested in finding ways to develop the children's swimming ability and skills. 

This web page has been made with Arthur, Joshua and Charlie in mind. 

Some videos are for the children to view on their own, other videos are for mum and dad to view with them.");
        };

        // Change handler
        select.onchange = function(_) {
            video.src = select.value;
            video.play();
        };

        // Change handler
        selectBS.onchange = function(_) {
            video.src = selectBS.value;
            video.play();
        };

                // Change handler
        selectBrS.onchange = function(_) {
            video.src = selectBrS.value;
            video.play();
        };

        
                // Change handler
        selectFC.onchange = function(_) {
            video.src = selectFC.value;
            video.play();
        };
        
        injectCSS();
        // Add to DOM
        Browser.document.body.appendChild(select);
        Browser.document.body.appendChild(selectFC);
        Browser.document.body.appendChild(selectBS);
        Browser.document.body.appendChild(selectBrS);
        Browser.document.body.appendChild(aboutScrn);
        Browser.document.body.appendChild(video);

    }

    
    static function injectCSS() {
        var style = Browser.document.createStyleElement();
        style.innerHTML = "
            body {
                font-family: Arial, sans-serif;
                background: #f5f5f5;
                padding: 20px;
            }

            #videoSelector {
                padding: 8px 12px;
                font-size: 12px;
                margin-bottom: 20px;
                border-radius: 6px;
                border: 1px solid #ccc;
                background: lightblue;
                margin-right: 5px;
                margin-left: 5%;
            }

            #aboutScrn {
                padding: 8px 12px;
                font-size: 12px;
                margin-bottom: 20px;
                border-radius: 6px;
                border: 1px solid #ccc;
                background: lightblue;
                margin-right: 5px;
                margin-left: 5%;
            }

            #videoSelectorBS {
                padding: 8px 12px;
                font-size: 12px;
                margin-bottom: 20px;
                border-radius: 6px;
                border: 1px solid #ccc;
                background: lightblue;
                margin-right: 5px;
                margin-left: 5%;
            }
                            
            #videoSelectorBrS {
                padding: 8px 12px;
                font-size: 12px;
                margin-bottom: 20px;
                border-radius: 6px;
                border: 1px solid #ccc;
                background: lightblue;
            }
            #videoSelectorFC {
                padding: 8px 12px;
                font-size: 12px;
                margin-bottom: 20px;
                border-radius: 6px;
                border: 1px solid #ccc;
                background: lightblue;
            }

            #player {
                display: block;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.15);
                margin-left: 5%;
                width:90%;
                height: auto;
            }
        ";
        Browser.document.head.appendChild(style);
    }
}