<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="{$userLang}">
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
    <meta http-equiv="X-UA-Compatible" content="IE=8" >
    <title>{$pageTitle|truncate:64:"..."}</title>
    {if $addHeader}{$addHeader}{/if}
    <link rel="search" type="application/opensearchdescription+xml" title="Library Catalog Search" href="{$url}/Search/OpenSearch?method=describe" >
    {if $consolidateCss}
      {css filename="consolidated_css.css"}
    {else}
	    {css filename="basicHtml.css"}
	    {css filename="layout.css"}
	    {css filename="jqueryui.css"}
    	{css media="screen" filename="styles.css"}
    	{css media ="screen" filename="book-bag.css"}
    	{css filename="title-scroller.css"}
	  	{css filename="my-account.css"}
	  	{css filename="holdingsSummary.css"}
	  	{css filename="ratings.css"}
	  	{css filename="book-bag.css"}
	  	{css filename="jquery.tooltip.css"}
	  	{css filename="tooltip.css"}
	  	{css filename="record.css"}
	  	{css filename="search-results.css"}
	  	{css filename="suggestions.css"}
	  	{css filename="reports.css"}
	  	{css filename="prospector.css"}
	  	{css filename="marmot.css"}
	  	{css filename="extra_styles.css"}
	  	<link rel="stylesheet" type="text/css" href="http://mesacountylibraries.org/wp-content/themes/mcpl/styles/superfish.css" />
    {/if}
    {css media="print" filename="print.css"}
    	
    <script type="text/javascript">
      path = '{$path}';
      url = '{$url}';
      loggedIn = {if $user}true{else}false{/if}
    </script>
    
    {if $consolidateJs}
    	<script type="text/javascript" src="{$path}/API/ConsolidatedJs"></script>
    {else}
	    <script type="text/javascript" src="{$path}/js/jquery-1.7.1.min.js"></script>
	    <script type="text/javascript" src="{$path}/js/jqueryui/jquery-ui-1.8.18.custom.min.js"></script>
	    <script type="text/javascript" src="{$path}/js/jquery.plugins.js"></script>
      
	    <script type="text/javascript" src="{$path}/js/scripts.js"></script>
	    
	    {if $enableBookCart}
	    <script type="text/javascript" src="{$path}/js/bookcart/json2.js"></script>
	    <script type="text/javascript" src="{$path}/js/bookcart/bookcart.js"></script>
		  {/if}
	    
		  <script type="text/javascript" src="{$path}/js/title-scroller.js"></script>
      <script type="text/javascript" src="{$path}/services/Search/ajax.js"></script>
			<script type="text/javascript" src="{$path}/services/Record/ajax.js"></script>
			
			<script type="text/javascript" src="{$path}/js/overdrive.js"></script>
		  
    {/if}
    
    {* Files that should not be combined *}
    {if $includeAutoLogoutCode == true}
    <script  type="text/javascript" src="{$path}/js/autoLogout.js"></script>
    {/if}
  
    
    {if isset($theme_css)}
    <link rel="stylesheet" type="text/css" href="{$theme_css}" >
    {/if}
  </head>

  <body class="{$module} {$action}" onload="{literal}if(document.searchForm != null && document.searchForm.lookfor != null){ document.searchForm.lookfor.focus();} if(document.loginForm != null){document.loginForm.username.focus();}{/literal}">
   {include file="bookcart.tpl"}
  
    <!-- Current Physical Location: {$physicalLocation} -->
    {* LightBox *}
    <div id="lightboxLoading" style="display: none;">{translate text="Loading"}...</div>
    <div id="lightboxError" style="display: none;">{translate text="lightbox_error"}</div>
    <div id="lightbox" onclick="hideLightbox(); return false;"></div>
    <div id="popupbox" class="popupBox"><b class="btop"><b></b></b></div>
    {* End LightBox *}
    
    <div class="searchheader">
      <div class="searchcontent">
        {include file='login-block.tpl'}
		{include file ='mesaheader.tpl'}
        

        <br clear="all">
        
        {if $showTopSearchBox}
          <div id='searchbar'>
          {if $pageTemplate != 'advanced.tpl'}
            {include file="searchbar.tpl"}
          {/if}
          </div>
        {/if}
      </div>
    </div>
    
    {if $showBreadcrumbs}
    <div class="breadcrumbs">
      <div class="breadcrumbinner">
        <a href="{$homeBreadcrumbLink}">{translate text="Home"}</a> <span>&gt;</span>
        {include file="$module/breadcrumbs.tpl"}
      </div>
    </div>
    {/if}
    
    <div id="doc2" class="yui-t4"> {* Change id for page width, class for menu layout. *}

      {if $useSolr || $useWorldcat || $useSummon}
      <div id="toptab">
        <ul>
          {if $useSolr}
          <li{if $module != "WorldCat" && $module != "Summon"} class="active"{/if}><a href="{$url}/Search/Results?lookfor={$lookfor|escape:"url"}">{translate text="University Library"}</a></li>
          {/if}
          {if $useWorldcat}
          <li{if $module == "WorldCat"} class="active"{/if}><a href="{$url}/WorldCat/Search?lookfor={$lookfor|escape:"url"}">{translate text="Other Libraries"}</a></li>
          {/if}
          {if $useSummon}
          <li{if $module == "Summon"} class="active"{/if}><a href="{$url}/Summon/Search?lookfor={$lookfor|escape:"url"}">{translate text="Journal Articles"}</a></li>
          {/if}
        </ul>
      </div>
      <div style="clear: left;"></div>
      {/if}

      {include file="$module/$pageTemplate"}
      
      {if $hold_message}
        <script type="text/javascript">
        lightbox();
        document.getElementById('popupbox').innerHTML = "{$hold_message|escape:"javascript"}";
        </script>
      {/if}

      <div id="ft">
      {include file="footer.tpl"}
      </div> {* End ft *}

    </div> {* End doc *}
 {include file ='mesafooter.tpl'}
  </body>
</html>