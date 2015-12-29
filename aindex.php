<?php
error_reporting(0);
const CHARSET = 'utf-8';
include 'lib/segment.class.php';

$seg = new segment();
$res = $seg->get_keyword('圣诞节早上星期五我吃了套煎饼果子 ');
var_dump($res);