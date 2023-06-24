function xuLy($scope) {
    $scope.checkForm = function () {
        var id = document.getElementByName('id').value.trim();
        var title = document.getElementByName('title').value.trim();
        var views = document.getElementsByName('views');
        var poster = document.getElementsByName('poster');
        var test = 0;
        if (id == "") {
            alert("Vui lòng nhập id của video!");
            return;
        }
        if (title == "") {
            alert("Vui lòng nhập tiêu đề của video!");
            return;
        }
        if (views == "") {
            alert("Vui lòng nhập số lượt xem của video!");
            return;
        }
        if (isNaN(views) == true) {
            alert("Vui lòng nhập số!");
            return;
        }
        if (poster == "") {
            alert("Vui lòng nhập tên file ảnh của video!");
            return;
        }
        if (id != "" && title != "" && views != "" && poster != "") {
            test = 1;
        }
        if (test == 1) {
            alert("Cập nhật thành công!");
        }
    }
}