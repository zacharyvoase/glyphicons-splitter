var page = require('webpage').create(),
    system = require('system');

page.open(system.args[1], function (status) {
    if (status !== 'success') { console.log('FAIL'); phantom.exit(); return; }
    var boxes = page.evaluate(function () {
        var paths = document.querySelectorAll('#glyphicons > g');
        var i, boxes = [];
        for (i = 0; i < paths.length; i++) {
            var bbox = paths[i].getBBox(),
                bboxObj = {x: bbox.x, y: bbox.y,
                           width: bbox.width, height: bbox.height};
            boxes.push([paths[i].id, bboxObj]);
        }
        return boxes;
    });
    console.log(JSON.stringify(boxes));
    phantom.exit();
});
