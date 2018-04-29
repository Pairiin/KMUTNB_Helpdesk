<?php
session_start();
if ($_SESSION['user_admin'] == "") {
    ?>
    <meta http-equiv='refresh' content='0;URL=index.php?id=login'>
    <?
		//exit();
} else {

    ?>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>กราฟสรุปความพึงพอใจในแต่ละเดือน</title>
    <?php include "a_inc_css.php"; ?>

    <?php include"a_inc_js.php"; ?>


    </head>
     <body class="sidebar-mini fixed">
       <div class="wrapper">

        <?php include "connect.php"; ?><!-- connect database -->
        <?php include "a_header.php"; ?><!-- header -->
        <?php include "a_side_nav.php"; ?><!-- Side-Nav-->
        <?php include "function.php"; ?><!-- function-->


        <?php

        $m=$_REQUEST['month'];
        $id_question=$_REQUEST['id_question'];


        if($m=="มกราคม"){
          $id_month="1";
        }
        elseif ($m=="กุมภาพันธ์") {
          $id_month="2";
        }
        elseif ($m=="มีนาคม") {
          $id_month="3";
        }
        elseif ($m=="เมษายน") {
          $id_month="4 ";
        }
        elseif ($m=="พฤษภาคม") {
          $id_month="5 ";
        }
        elseif ($m=="มิถุนายน") {
          $id_month="6 ";
        }
        elseif ($m=="กรกฎาคม") {
          $id_month="7 ";
        }
        elseif ($m=="สิงหาคม") {
          $id_month="8 ";
        }
        elseif ($m=="กันยายน") {
          $id_month="9";
        }
        elseif ($m=="ตุลาคม") {
          $id_month="10";
        }
        elseif ($m=="พฤศจิกายน") {
          $id_month="11";
        }
        elseif ($m=="ธันวาคม") {
          $id_month="12";
        }

          $id_point = array(); // ตัวแปรแกน x
          $point_name = array();
          $sqlpoint = "select * from point";
          $respoint = mysql_query($sqlpoint);
          while($row=mysql_fetch_array($respoint)) {
            array_push($point_name,$row['point_name']);
          }
          for($i=0;$i<count($point_name);$i++){
            $id_point[$i] = 0;
          }
        $sql = "SELECT detail_satisfaction.id_question, question.question_name , point_name, COUNT( detail_satisfaction.id_point )as numpoint
        FROM detail_satisfaction
        INNER JOIN satisfaction ON detail_satisfaction.id_satisfaction = satisfaction.id_satisfaction
        INNER JOIN question ON detail_satisfaction.id_question = question.id_question
        INNER JOIN POINT ON detail_satisfaction.id_point = point.id_point
        WHERE MONTH( date_assessment ) =  '$id_month'
        AND detail_satisfaction.id_question =  '$id_question'
        GROUP BY detail_satisfaction.id_point";

        $result = mysql_query($sql);
        while($row=mysql_fetch_array($result)) {
          $num1=mysql_num_rows($result);
        //array_push คือการนำค่าที่ได้จาก sql ใส่เข้าไปตัวแปร array
        for($i=0;$i<count($point_name);$i++){
          if($row['point_name'] == $point_name[$i]) $id_point[$i]=$row[numpoint];
        }
        $question_name = $row[question_name];
        }

        /*$xmonth = array(); // ตัวแปรแกน x
        //sql สำหรับดึงข้อมูล จาก ฐานข้อมูล
        $sql = "SELECT point.`point_name`FROM point";
        $result = mysql_query($sql);
        while($row=mysql_fetch_array($result)) {
        //array_push คือการนำค่าที่ได้จาก sql ใส่เข้าไปตัวแปร array
        array_push($xmonth,$row[point_name]);
        }*/

        ?>
        <div class="content-wrapper">
            <div class="page-title">
                <div>
                    <h1><i class="fa fa-bar-chart fa-lg"></i>รายงานสรุปความพึงพอใจในแต่ละเดือน</h1>
                </div>
            </div>
            <div class="row">
              <div class="col-md-11">
                <div class="container-fluid" style="padding-top:10px;">
                    <div class="card">
                  <div class="embed-responsive embed-responsive-16by9">
                  <?
                     if($num1<=0){ ?>

                      <script>
                          setTimeout(function() {
                              swal({
                                  title: "ไม่พบข้อมูลที่ต้องการ!!",
                                  text: "คลิกปุ่ม \"OK\" เพื่อรับทราบ",
                                  type: "warning",
                                  confirmButtonText: "OK"
                              }, function() {
                                  window.location = "a_report_satisfaction.php";
                              }, 1000);
                          });
                      </script>
                    <?   }
                  else{ ?>
                    <div id="container" style="min-width: auto; height: auto;; margin: 5 auto"></div>
              <?   } ?>

                    </div>
                  </div>
              </div>
            </div>
          </div>
    </div>

   </body>
</html>
<script>
$(function () {
$('#container').highcharts({
    chart: {
        type: 'column' //รูปแบบของ แผนภูมิ ในที่นี้ให้เป็น line
    },
    title: {
        text: '<?php echo "หัวข้อ : ".$question_name."<br>"."เดือน : ".$m ?>' //
    },
    subtitle: {
        text: '<?php echo "ข้อมูล ณ วันที่".DateThai(date("Y-m-d"));?>'
    },
    xAxis: {
        categories: ['<?= implode("','", $point_name); ?>']
    },
    yAxis: {
        title: {
            text: 'คะแนน (ข้อ)'
        }
    },
    tooltip: {
        enabled: false,
        formatter: function() {
            return '<b>'+ this.series.name +'</b><br/>'+
                this.x +': '+ this.y +'ราย';
        }
    },
legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'top',
                    x: -10,
                    y: 100,
                    borderWidth: 0
    },
    plotOptions: {
        line: {
            dataLabels: {
                enabled: true
            },
            enableMouseTracking: false
        }
    },
    series: [{
                        name: 'ระดับความพึงพอใจ',
                        data: [<?= implode(',', $id_point) // ข้อมูล array แกน y ?>]
                    }]
});
});
</script>
<?php } ?>
