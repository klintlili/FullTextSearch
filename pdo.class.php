<?php
define("CHARSET","utf-8");
define("DB_HOST","localhost");
define("DB_NAME","test");
define("DB_USER","root");
define("DB_PASS","");
define("DSN","mysql:host=".DB_HOST.";charset=utf8;dbname=".DB_NAME);
try{
	$pdo = new PDO(DSN,DB_USER,DB_PASS);
}catch(PDOException $e)
{
	echo $e->getMessage();
}
switch(strval($_GET['action']))
{
	case "search":
		$key=$_POST['con']?$_POST['con']:'刘明伟';
		$keylen=mb_strlen($key,'utf-8');
		if($keylen <2 || $keylen >5)
		{
			exit("搜索关键字的长度应该在2-5位之间");
		}
		$sql="select a_id from tb_article_index where MATCH(keywords) AGAINST(:key)";
		$msg.="索引表sql: ".$sql;
		$sta=$pdo->prepare($sql);
		//简单汉字编码
		$sta->execute(array(':key'=>bin2hex($key)));
		$data=$sta->fetchAll(PDO::FETCH_ASSOC);
		if($sta->rowCount())
		{
			foreach($data as $row)
			{
				$gid[]=$row['a_id'];
			}
			print_r($gid);
			//根据 索引表中的命中id，去主表中查找文章
			$sql = "select a_title,a_cont from tb_article where a_id in(".implode(',',$gid).")";
			$msg.="<br>主表的sql: ".$sql;
			$sta = $pdo->prepare($sql);
			$sta->execute();
			$arti_data=$sta->fetchALL(PDO::FETCH_ASSOC);
			$msg.=print_r($arti_data,true);
		}else
		{
			$msg.="<br>没有关键字的匹配";
		}
		break;
	case "insert":
		//因为主表和索引表的数据要保持一致，所以应用事务处理。使得两个表同时成功
		if(!$pdo->beginTransaction())
		{
			exit("事务繁忙");
		}
		if(empty($_POST['title']) || empty($_POST['cont']))
		{
			exit("请把标题和文章写完整了再说!");
		}
		//向主表中插入数据
		$sql="insert into tb_article values(null,:title,:cont)";
		$msg.="<br>主表insert sql：".$sql;
		$sta=$pdo->prepare($sql);
		$sta->execute(array(':title'=>$_POST['title'],':cont'=>$_POST['cont']));
		if($sta->rowCount())
		{
			$lastid=$pdo->lastInsertId();
			require("./lib/segment.class.php");
			$seg = new segment();
			$keys=$seg->get_keyword($_POST['cont']);
			//把中文转成字母，为方便两个汉字的查找
			foreach(explode(' ',$keys) as $va)
			{
				$tmparr2[]=bin2hex($va);
			}
			$keychars=implode(' ',$tmparr2);
			$sql="insert into tb_article_index values(null,:keywords,:a_id)";
			$sta = $pdo->prepare($sql);
			$sta->execute(array(':keywords'=>$keychars,':a_id'=>$lastid));
			if($sta->rowCount())
			{
				$msg.="<br>本次入库的关键词是：".$keys;
				$msg.="<br>入库成功";
				$pdo->commit();
			}else
			{
				$pdo->rollBack();
				$msg.=print_r($sta->errorInfo(),true);
				$msg.="入库失败2";
			}
		}else
		{
			$msg.=print_r($sta->errorInfo(),true);
			$msg.="入库失败";
		}
		break;
	default:
		$msg.="操作非法";
}
return $msg;