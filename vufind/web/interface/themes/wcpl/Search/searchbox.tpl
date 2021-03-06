<div class="searchform">
  {if $searchType == 'advanced'}
    <a href="{$path}/Search/Advanced?edit={$searchId}" class="small">{translate text="Edit this Advanced Search"}</a> |
    <a href="{$path}/Search/Advanced" class="small">{translate text="Start a new Advanced Search"}</a> |
    <a href="{$url}" class="small">{translate text="Start a new Basic Search"}</a>
    <br />{translate text="Your search terms"} : "<b>{$lookfor|escape:"html"}</b>"
  {else}
    <form method="get" action="{$path}/Union/Search" id="searchForm" class="search">
      <div id="searchbar">
      <img src='{$path}/interface/themes/{$theme}/images/searchbar-left.png' alt='' />
      <select name="basicType" id="type">
      {foreach from=$basicSearchTypes item=searchDesc key=searchVal}
        <option value="{$searchVal}"{if $searchIndex == $searchVal} selected="selected"{/if}>{translate text=$searchDesc}</option>
      {/foreach}
      </select>
      {if $userLang == 'es'}
      <img src='{$path}/interface/themes/{$theme}/images/sp_searchbar-search-label.png' alt='Search' />
      {else}
      <img src='{$path}/interface/themes/{$theme}/images/searchbar-search-label.png' alt='Search' />
      {/if}
      <input id="lookfor" type="text" name="lookfor" size="30" value="{$lookfor|escape:"html"}" />
      <div class="searchGoButton" id="searchGo" onclick="javascript:searchSubmit();">{translate text="GO"}</div>
      {if $filterList || $hasCheckboxFilters}
	    <div class="keepFilters">
	      <input id="retainFiltersCheckbox" type="checkbox" onclick="filterAll(this);" /> {translate text="basic_search_keep_filters"}
	      <div style="display:none;">
	        {foreach from=$filterList item=data key=field}
		        {foreach from=$data item=value}
		          <input type="checkbox" name="filter[]" value='{$value.field}:"{$value.value|escape}"' />
		        {/foreach}
	        {/foreach}
	        {foreach from=$checkboxFilters item=current}
            {if $current.selected}
              <input type="checkbox" name="filter[]" value="{$current.filter|escape}" />
            {/if}
          {/foreach}
	      </div>
	    </div>
      {/if}
            
</div>
      
      {* Do we have any checkbox filters? *}
      {assign var="hasCheckboxFilters" value="0"}
      {if isset($checkboxFilters) && count($checkboxFilters) > 0}
        {foreach from=$checkboxFilters item=current}
          {if $current.selected}
            {assign var="hasCheckboxFilters" value="1"}
          {/if}
        {/foreach}
      {/if}
      
    </form>
    {if false && strlen($lookfor) > 0 && count($repeatSearchOptions) > 0}
    <div class='repeatSearchBox'>
      <label for='repeatSearchIn'>Repeat Search In: </label>
      <select name="repeatSearchIn" id="repeatSearchIn">
        {foreach from=$repeatSearchOptions item=repeatSearchOption}
          <option value="{$repeatSearchOption.link}">{$repeatSearchOption.name}</option>
        {/foreach}
      </select>
      <input type="button" name="repeatSearch" value="{translate text="Go"}" onclick="window.open(document.getElementById('repeatSearchIn').options[document.getElementById('repeatSearchIn').selectedIndex].value)">
    </div>
    {/if}
    
  {/if}
</div>
