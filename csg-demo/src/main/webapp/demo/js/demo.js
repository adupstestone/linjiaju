$(function () {
    $('#change-region').click(function (event) {
        $('#region-list').toggle();
        event.stopPropagation();
    });

    $(document).click(function () {
        //对document绑定一个隐藏Div方法
        $("#region-list").hide();
    });

    $("#region-list").click(function (event) {
        //在Div区域内的点击事件阻止冒泡到document
        event.stopPropagation();
    });

    $('#region-dl').find('dt').bind({
        'mouseenter mouseleave': function () {
            $(this).toggleClass('deep-gray');
        },
        'click': function () {
            $('#change-region').text($(this).text());
            $("#region-list").hide();
        }
    });

    $('#menus').find('a').each(function (i) {
        if (i == menu) {
            $('#menus').find('a.hover').removeClass('hover');
            $(this).addClass('hover');
            return false;
        }
    });
});