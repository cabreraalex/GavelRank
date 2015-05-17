$(document).on('click', '.header', function (event) {
    console.log("click:", event);
    event.stopImmediatePropagation();
    $header = $(this);
    //getting the next element
    $content = $header.next();
    $content.height("80px");
    //open up the content needed - toggle the slide- if visible, slide up, if not slidedown.

    $content.slideToggle(200, function () {
        //execute this after slideToggle is done
        //change text of header based on visibility of content div
        
        $header.text(function () {
            //change text based on condition
            //return $content.is(":visible") ? "Collapse" : "Expand";
        });
    });
});
$(document).on('click', '#hint', function (event) {
    console.log("Hint:", event);
    $content = $(this).next();
    console.log($content);
    event.stopImmediatePropagation();
    $content.slideToggle(200, function () {
        //execute this after slideToggle is done
        //change text of header based on visibility of content div
        
        $header.text(function () {
            //change text based on condition
           // return $content.is(":visible") ? "Collapse" : "Expand";
        });
    });
});
