<?php

function display_errors($errors){
    if(count($errors)){
          $erros = ' <div class="form-group">
                <div class="alert alert-danger" role="alert">
                    <ul>';
                        foreach($errors->all() as $error){
                $erros .= '<li>'.$error.'</li>';
                        }
          $erros .= '</ul>
                </div>
            </div>';
            echo $erros;
    }
}


 //table action
 function tableActions($view_route="",$edit_route="",$del_route=""){
    $actions =  '<div class="table-data-feature btn-group">
                <button type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="item "><i class="zmdi zmdi-more"></i></button>
                <div tabindex="-1" aria-hidden="true" role="menu" class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 38px, 0px); top: 0px; left: 0px; will-change: transform;">';
                if($view_route!=""){
                  $actions .=  '<a href="'.$view_route.'" tabindex="0" class="dropdown-item">View</a>';
                }
                if($edit_route!=""){
                  $actions .=  '<a href="'.$view_route.'" tabindex="0" class="dropdown-item">Edit</a>';
                }
                if($del_route!=""){
                  $actions .=  '<a href="#" tabindex="0" class="dropdown-item" onclick="return confirm(\'Are you sure to delete this record?\')">Delete</a>';
                }        
    $actions .=  '</div></div>';
    echo $actions;
  }