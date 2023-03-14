<?php
	include '../../includes/session.php';
	include '../../includes/function.php';
	
	if(isset($_POST['add'])){
		$menu_type=$item_id=$slug="";
		$menu_name = $_POST['menu_name'];
		$parent_id = $_POST['parent_id'];
		$link_type = $_POST['link_type'];

		if($link_type=='Internal'){
			$menu_type = $_POST['menu_type'];
			if($menu_type=='Page'){
				$item_id = $_POST['page'];
			}elseif($menu_type=='Category'){
				$item_id = $_POST['category'];
			}
		}elseif($link_type=="External"){
			$slug = $_POST['slug'];
		}
		$name = $_POST['name'];
		$item_target = $_POST['item_target'];
		$class = $_POST['class'];
		$menu_order = $_POST['menu_order'];
		
		$createDate = date('Y-m-d h:i:s');

		$conn = $pdo->open();	
		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM menus WHERE name=:name AND menu_name=:menu_name AND parent_id=:parent_id");
		$stmt->execute(['name'=>$name,'menu_name'=>$menu_name, 'parent_id'=>$parent_id]);
		$row = $stmt->fetch();

		if($row['numrows'] > 0){			
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>Menu Name  already exist</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));
		}else{			
		    
			try{
				$stmt = $conn->prepare("INSERT INTO menus (
								menu_name,parent_id,link_type,menu_type,item_id,name, slug,item_target,class,createDate,menu_order) 
				VALUES (:menu_name,:parent_id,:link_type,:menu_type,:item_id,:name,:slug, :item_target,:class,:createDate,:menu_order)");
				$stmt->execute(['menu_name'=>$menu_name,'parent_id'=>$parent_id,'link_type'=>$link_type,
				'menu_type'=>$menu_type,'item_id'=>$item_id,'name'=>$name,'slug'=>$slug,'item_target'=>$item_target
				,'class'=>$class,'createDate'=>$createDate,'menu_order'=>$menu_order]);
				
				$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Menu added successfully</div>";
				echo json_encode(array('sts'=>1,'msg'=>$msg));

			}
			catch(PDOException $e){
				$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>".$e->getMessage()."</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));				
			}
		}
		$pdo->close();
	}elseif(isset($_POST['delete'])){
		$id = $_POST['id'];		
		$conn = $pdo->open();
		try{
			$stmt = $conn->prepare("DELETE FROM menus WHERE id=:id");
			$stmt->execute(['id'=>$id]);
			$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Menu deleted successfully</div>";
				echo json_encode(array('sts'=>1,'msg'=>$msg));
		}
		catch(PDOException $e){
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>".$e->getMessage()."</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));	
		}
		$pdo->close();
	}
	elseif(isset($_POST['edit'])){
		$id = $_POST['id'];
		$menu_type=$item_id=$slug="";
		$menu_name = $_POST['menu_name'];
		$parent_id = $_POST['parent_id'];
		$link_type = $_POST['link_type'];

		if($link_type=='Internal'){
			$menu_type = $_POST['menu_type'];
			if($menu_type=='Page'){
				$item_id = $_POST['page'];
			}elseif($menu_type=='Category'){
				$item_id = $_POST['category'];
			}
		}elseif($link_type=="External"){
			$slug = $_POST['slug'];
		}
		$name = $_POST['name'];
		$item_target = $_POST['item_target'];
		$class = $_POST['class'];	
		$status = $_POST['status'];
		$menu_order = $_POST['menu_order'];					
		$conn = $pdo->open();
		
		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM menus 
		WHERE id!=:id AND ( name=:name AND menu_name=:menu_name AND parent_id=:parent_id )");
		$stmt->execute(['id'=>$id,'name'=>$name,'menu_name'=>$menu_name,'parent_id'=>$parent_id]);
		$row = $stmt->fetch();
		if($row['numrows'] > 0){			
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>Menu already exist</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));
		}else{			
			
			try{
				$stmt = $conn->prepare("UPDATE menus SET menu_name=:menu_name,
				parent_id=:parent_id,link_type=:link_type,menu_type=:menu_type,item_id=:item_id,slug=:slug,
				name=:name,item_target=:item_target,class=:class,status=:status,menu_order=:menu_order WHERE id=:id");
				$stmt->execute(['menu_name'=>$menu_name,'parent_id'=>$parent_id,'link_type'=>$link_type,
				'menu_type'=>$menu_type,'item_id'=>$item_id,'slug'=>$slug,'name'=>$name,
				'item_target'=>$item_target,'class'=>$class,'status'=>$status,'id'=>$id,'menu_order'=>$menu_order]);
				$msg="<div class='alert alert-success alert-dismissible'>
					<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
					<h4><i class='icon fa fa-check'></i> Success!</h4>Menu updated successfully</div>";
					echo json_encode(array('sts'=>1,'msg'=>$msg));
			}
			catch(PDOException $e){
				$msg="<div class='alert alert-danger alert-dismissible'>
					<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
					<h4><i class='icon fa fa-warning'></i> Error!</h4>".$e->getMessage()."</div>";
					echo json_encode(array('sts'=>0,'msg'=>$msg));
			}
		}
		$pdo->close();
	}
	else{
		echo json_encode(array('status'=>0,'msg'=>"<div class='alert alert-danger alert-dismissible'>
			<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
			<h4><i class='icon fa fa-warning'></i> Error! </h4>Oops something went wrong. please try again.</div>"));
			die;
	}
	die;
	
?>