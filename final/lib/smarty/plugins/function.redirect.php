<?php

    function smarty_function_redirect($params, $smarty)
    {
        $page = $params['page'];
        header('Location: ' . '../' . $page);
    }

?>