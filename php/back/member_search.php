<?php
ini_set('display' , '1');
error_reporting(E_ALL);
?>

<?php
    include('../Conn.php');
    $select = $_POST["select"];
    $textbox = $_POST["textbox"];
    // echo $select.$textbox;

    if( $select = 'id'){
        $sql = 'SELECT e.*, count(d.work_id)
                FROM 
                    member e
                    left join work d
                        on e.member_id = d.member_id
                where e.member_id = ?
                group by member_id';
    }elseif( $select = 'name'){
        $sql = 'SELECT e.*, count(d.work_id)
                FROM 
                    member e
                    left join work d
                        on e.member_id = d.member_id
                where e.name = ?
                group by member_id';
    };


    $statement = $pdo->prepare($sql);
    $statement -> bindValue(1, $textbox);    
    $statement->execute();  





    //抓出全部且依照順序封裝成一個二維陣列
    $data = $statement->fetchAll();

    echo "<tr class='table-dark'>
            <th>編號</th>
            <th>姓名</th>
            <th>帳號</th>
            <th>密碼</th>
            <th>email</th>
            <th>等級</th>
            <th>黑名單</th>
            <th>自我介紹</th>
            <th>作品數</th>
            <th>加入日期</th>
            <td></td>
        </tr>";
    
    foreach($data as $index => $row){
        echo "<tr class='table-light'><td>".$row["member_id"]."</td>";
        echo "<td>".$row["name"]."</td>";
        echo "<td>".$row["account"]."</td>";
        echo "<td>".$row["password"]."</td>";
        echo "<td>".$row["email"]."</td>";

        $level=$row["level"];
        switch ($level) {
            case "1":
                $level = '高級會員';
            break;
            case "2":
                $level = '普通會員';
            break;
            default:
                $level = '錯誤';
        };
        echo "<td>".$level."</td>";

        $blacklist=$row["blacklist"];
        switch ($blacklist) {
            case "1":
                $blacklist = '黑名單';
            break;
            case "2":
                $blacklist = '白名單';
            break;
            default:
                $level = '錯誤';
        };
        echo "<td>".$blacklist."</td>";

        echo "<td>".$row["introduction"]."</td>";
        echo "<td>".$row["count(d.work_id)"]."</td>";
        echo "<td>".$row["join_date"]."</td>";
        echo "<td width='40'><a href=''>編輯</a></td></tr>";
    }
?>
