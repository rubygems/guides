<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>class Gem::Specification - RDoc Documentation</title>


  <meta
    name="keywords"
    content="ruby,class,Gem::Specification"
  >

    <meta
      name="description"
      content="class Gem::Specification: The Specification class contains the information for a gem. Typically defined in a ."
    >





<!-- Open Graph / Facebook -->
<meta property="og:type" content="website">
<meta property="og:title" content="class Gem::Specification - RDoc Documentation">



    <meta property="og:description" content="The Specification class contains the information for a gem. Typically defined in a .">





<!-- Twitter -->
<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="class Gem::Specification - RDoc Documentation">



    <meta name="twitter:description" content="The Specification class contains the information for a gem. Typically defined in a .">



<script type="text/javascript">
  var rdoc_rel_prefix = "../";
  var index_rel_prefix = "../";
</script>

<script
  src="../js/theme-toggle.js?v=7.1.0"
></script>

<script
  src="../js/search_navigation.js?v=7.1.0"
  defer
></script>

<script
  src="../js/search_data.js?v=7.1.0"
  defer
></script>

<script
  src="../js/search_ranker.js?v=7.1.0"
  defer
></script>

<script
  src="../js/search_controller.js?v=7.1.0"
  defer
></script>

<script
  src="../js/c_highlighter.js?v=7.1.0"
  defer
></script>

<script
  src="../js/aliki.js?v=7.1.0"
  defer
></script>

<link
  href="../css/rdoc.css?v=7.1.0"
  rel="stylesheet"
>




<body role="document" class="class has-toc">
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <!-- Chevron (right arrow) - used for expand/collapse -->
  <symbol
    id="icon-chevron"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    stroke-width="2"
    stroke-linecap="round"
    stroke-linejoin="round"
  >
    <polyline points="9 18 15 12 9 6"></polyline>
  </symbol>

  <!-- File/Document - Pages section -->
  <symbol
    id="icon-file"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    stroke-width="2"
    stroke-linecap="round"
    stroke-linejoin="round"
  >
    <path
      d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z"
    ></path>

    <polyline points="14 2 14 8 20 8"></polyline>
  </symbol>

  <!-- Layers/Stack - Classes and Modules section -->
  <symbol
    id="icon-layers"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    stroke-width="2"
    stroke-linecap="round"
    stroke-linejoin="round"
  >
    <polygon points="12 2 2 7 12 12 22 7 12 2"></polygon>
    <polyline points="2 17 12 22 22 17"></polyline>
    <polyline points="2 12 12 17 22 12"></polyline>
  </symbol>

  <!-- Curly braces with C - Class Methods section -->
  <symbol
    id="icon-class-methods"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    stroke-width="2"
    stroke-linecap="round"
    stroke-linejoin="round"
  >
    <path d="M6 3C3.5 3 2 4.5 2 7v3c0 1.5-1 2-1 2s1 .5 1 2v5c0 2.5 1.5 4 4 4"></path>
    <path d="M18 3c2.5 0 4 1.5 4 4v3c0 1.5 1 2 1 2s-1 .5-1 2v5c0 2.5-1.5 4-4 4"></path>

    <text
      x="12"
      y="17"
      text-anchor="middle"
      font-size="13"
      font-weight="bold"
      fill="currentColor"
      stroke="none"
    >
      C
    </text>
  </symbol>

  <!-- Curly braces with I - Instance Methods section -->
  <symbol
    id="icon-instance-methods"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    stroke-width="2"
    stroke-linecap="round"
    stroke-linejoin="round"
  >
    <path d="M6 3C3.5 3 2 4.5 2 7v3c0 1.5-1 2-1 2s1 .5 1 2v5c0 2.5 1.5 4 4 4"></path>
    <path d="M18 3c2.5 0 4 1.5 4 4v3c0 1.5 1 2 1 2s-1 .5-1 2v5c0 2.5-1.5 4-4 4"></path>

    <text
      x="12"
      y="17"
      text-anchor="middle"
      font-size="13"
      font-weight="bold"
      fill="currentColor"
      stroke="none"
    >
      I
    </text>
  </symbol>

  <!-- Double chevrons up - Ancestors section -->
  <symbol
    id="icon-ancestors"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    stroke-width="2"
    stroke-linecap="round"
    stroke-linejoin="round"
  >
    <polyline points="17 11 12 6 7 11"></polyline>
    <polyline points="17 18 12 13 7 18"></polyline>
  </symbol>

  <!-- User with plus - Included Modules section -->
  <symbol
    id="icon-includes"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    stroke-width="2"
    stroke-linecap="round"
    stroke-linejoin="round"
  >
    <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
    <circle cx="8.5" cy="7" r="4"></circle>

    <line
      x1="20"
      y1="8"
      x2="20"
      y2="14"
    ></line>

    <line
      x1="23"
      y1="11"
      x2="17"
      y2="11"
    ></line>
  </symbol>

  <!-- User with check - Extended Modules section -->
  <symbol
    id="icon-extends"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    stroke-width="2"
    stroke-linecap="round"
    stroke-linejoin="round"
  >
    <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
    <circle cx="8.5" cy="7" r="4"></circle>
    <polyline points="17 11 19 13 23 9"></polyline>
  </symbol>

  <!-- List - Sections section -->
  <symbol
    id="icon-list"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    stroke-width="2"
    stroke-linecap="round"
    stroke-linejoin="round"
  >
    <line
      x1="8"
      y1="6"
      x2="21"
      y2="6"
    ></line>

    <line
      x1="8"
      y1="12"
      x2="21"
      y2="12"
    ></line>

    <line
      x1="8"
      y1="18"
      x2="21"
      y2="18"
    ></line>

    <line
      x1="3"
      y1="6"
      x2="3.01"
      y2="6"
    ></line>

    <line
      x1="3"
      y1="12"
      x2="3.01"
      y2="12"
    ></line>

    <line
      x1="3"
      y1="18"
      x2="3.01"
      y2="18"
    ></line>
  </symbol>
</svg>

<header class="top-navbar">
  <a href="../index.html" class="navbar-brand">
    RDoc Documentation
  </a>

  <!-- Desktop search bar -->
  <div class="navbar-search navbar-search-desktop" role="search">
    <form action="#" method="get" accept-charset="utf-8">
      <input id="search-field" role="combobox" aria-label="Search"
             aria-autocomplete="list" aria-controls="search-results-desktop"
             type="text" name="search" placeholder="Search (/) for a class, method..."
             spellcheck="false" autocomplete="off"
             title="Type to search, Up and Down to navigate, Enter to load">
      <ul id="search-results-desktop" aria-label="Search Results"
          aria-busy="false" aria-expanded="false"
          aria-atomic="false" class="initially-hidden search-results"></ul>
    </form>
  </div>

  <!-- Mobile search icon button -->
  <button id="search-toggle" class="navbar-search-mobile" aria-label="Open search" type="button">
    <span aria-hidden="true">🔍</span>
  </button>

  <!-- Theme toggle button -->
  <button id="theme-toggle" class="theme-toggle" aria-label="Switch to dark mode" type="button">
    <span class="theme-toggle-icon" aria-hidden="true">🌙</span>
  </button>
</header>

<!-- Search Modal (Mobile) -->
<div id="search-modal" class="search-modal" hidden aria-modal="true" role="dialog" aria-label="Search">
  <div class="search-modal-backdrop"></div>
  <div class="search-modal-content">
    <div class="search-modal-header">
      <form class="search-modal-form" action="#" method="get" accept-charset="utf-8">
        <span class="search-modal-icon" aria-hidden="true">🔍</span>
        <input id="search-field-mobile" role="combobox" aria-label="Search"
               aria-autocomplete="list" aria-controls="search-results-mobile"
               type="text" name="search" placeholder="Search documentation"
               spellcheck="false" autocomplete="off">
        <button type="button" class="search-modal-close" aria-label="Close search" id="search-modal-close">
          <span aria-hidden="true">esc</span>
        </button>
      </form>
    </div>
    <div class="search-modal-body">
      <ul id="search-results-mobile" aria-label="Search Results"
          aria-busy="false" aria-expanded="false"
          aria-atomic="false" class="search-results search-modal-results initially-hidden"></ul>
      <div class="search-modal-empty">
        <p>No recent searches</p>
      </div>
    </div>
  </div>
</div>

<div id="navigation-toggle" role="button" tabindex="0" aria-label="Toggle sidebar" aria-expanded="true" aria-controls="navigation">
  <span aria-hidden="true">&#9776;</span>
</div>


<nav id="navigation" role="navigation" hidden>
  





  
<div id="sections-section" class="nav-section">
  <details class="nav-section-collapsible" open>
    <summary class="nav-section-header">
      <span class="nav-section-icon">
        <svg><use href="#icon-list"></use></svg>
      </span>
      <span class="nav-section-title">Sections</span>
      <span class="nav-section-chevron">
        <svg><use href="#icon-chevron"></use></svg>
      </span>
    </summary>

    <ul class="nav-list" role="directory">

        <li><a href="#untitled"></a></li>

        <li><a href="#optional-gemspec-attributes">Optional gemspec attributes</a></li>

        <li><a href="#read-only-attributes">Read-only attributes</a></li>

        <li><a href="#recommended-gemspec-attributes">Recommended gemspec attributes</a></li>

        <li><a href="#required-gemspec-attributes">Required gemspec attributes</a></li>

        <li><a href="#specification-internals">Specification internals</a></li>

    </ul>
  </details>
</div>


  
<div id="parent-class-section" class="nav-section">
  <details class="nav-section-collapsible" open>
    <summary class="nav-section-header">
      <span class="nav-section-icon">
        <svg><use href="#icon-ancestors"></use></svg>
      </span>
      <span class="nav-section-title">Ancestors</span>
      <span class="nav-section-chevron">
        <svg><use href="#icon-chevron"></use></svg>
      </span>
    </summary>
    <ul><li>Gem::BasicSpecification</li></ul>
  </details>
</div>


  

  
<div id="extends-section" class="nav-section">
  <details class="nav-section-collapsible" open>
    <summary class="nav-section-header">
      <span class="nav-section-icon">
        <svg><use href="#icon-extends"></use></svg>
      </span>
      <span class="nav-section-title">Extended With Modules</span>
      <span class="nav-section-chevron">
        <svg><use href="#icon-chevron"></use></svg>
      </span>
    </summary>

    <ul class="nav-list">


      <li><span class="extend">Enumerable</span></li>


    </ul>
  </details>
</div>


  
  <div class="nav-section">
    <details class="nav-section-collapsible" open>
      <summary class="nav-section-header">
        <span class="nav-section-icon">
          <svg><use href="#icon-class-methods"></use></svg>
        </span>
        <span class="nav-section-title">Class Methods</span>
        <span class="nav-section-chevron">
          <svg><use href="#icon-chevron"></use></svg>
        </span>
      </summary>
      <ul class="nav-list" role="directory">

        <li ><a href="#method-c-_load">_load</a></li>

        <li ><a href="#method-c-add_spec">add_spec</a></li>

        <li ><a href="#method-c-all">all</a></li>

        <li ><a href="#method-c-all-3D">all=</a></li>

        <li ><a href="#method-c-all_names">all_names</a></li>

        <li ><a href="#method-c-array_attributes">array_attributes</a></li>

        <li ><a href="#method-c-attribute_names">attribute_names</a></li>

        <li ><a href="#method-c-default_stubs">default_stubs</a></li>

        <li ><a href="#method-c-dirs">dirs</a></li>

        <li ><a href="#method-c-dirs-3D">dirs=</a></li>

        <li ><a href="#method-c-each">each</a></li>

        <li ><a href="#method-c-find_active_stub_by_path">find_active_stub_by_path</a></li>

        <li ><a href="#method-c-find_all_by_full_name">find_all_by_full_name</a></li>

        <li ><a href="#method-c-find_all_by_name">find_all_by_name</a></li>

        <li ><a href="#method-c-find_by_full_name">find_by_full_name</a></li>

        <li ><a href="#method-c-find_by_name">find_by_name</a></li>

        <li ><a href="#method-c-find_by_path">find_by_path</a></li>

        <li ><a href="#method-c-find_in_unresolved">find_in_unresolved</a></li>

        <li ><a href="#method-c-find_in_unresolved_tree">find_in_unresolved_tree</a></li>

        <li ><a href="#method-c-find_inactive_by_path">find_inactive_by_path</a></li>

        <li ><a href="#method-c-from_yaml">from_yaml</a></li>

        <li ><a href="#method-c-latest_spec_for">latest_spec_for</a></li>

        <li ><a href="#method-c-latest_specs">latest_specs</a></li>

        <li ><a href="#method-c-load">load</a></li>

        <li ><a href="#method-c-load_defaults">load_defaults</a></li>

        <li class="calls-super" ><a href="#method-c-new">new</a></li>

        <li ><a href="#method-c-non_nil_attributes">non_nil_attributes</a></li>

        <li ><a href="#method-c-normalize_yaml_input">normalize_yaml_input</a></li>

        <li ><a href="#method-c-outdated">outdated</a></li>

        <li ><a href="#method-c-outdated_and_latest_version">outdated_and_latest_version</a></li>

        <li ><a href="#method-c-remove_spec">remove_spec</a></li>

        <li ><a href="#method-c-required_attribute-3F">required_attribute?</a></li>

        <li ><a href="#method-c-required_attributes">required_attributes</a></li>

        <li ><a href="#method-c-reset">reset</a></li>

        <li ><a href="#method-c-specification_record">specification_record</a></li>

        <li ><a href="#method-c-stubs">stubs</a></li>

        <li ><a href="#method-c-stubs_for">stubs_for</a></li>

        <li ><a href="#method-c-unresolved_deps">unresolved_deps</a></li>

      </ul>
    </details>
  </div>



  <div class="nav-section">
    <details class="nav-section-collapsible" open>
      <summary class="nav-section-header">
        <span class="nav-section-icon">
          <svg><use href="#icon-instance-methods"></use></svg>
        </span>
        <span class="nav-section-title">Instance Methods</span>
        <span class="nav-section-chevron">
          <svg><use href="#icon-chevron"></use></svg>
        </span>
      </summary>
      <ul class="nav-list" role="directory">

        <li ><a href="#method-i-_dump">_dump</a></li>

        <li ><a href="#method-i-abbreviate">abbreviate</a></li>

        <li ><a href="#method-i-activate">activate</a></li>

        <li ><a href="#method-i-activate_dependencies">activate_dependencies</a></li>

        <li ><a href="#method-i-add_bindir">add_bindir</a></li>

        <li ><a href="#method-i-add_dependency">add_dependency</a></li>

        <li ><a href="#method-i-add_development_dependency">add_development_dependency</a></li>

        <li ><a href="#method-i-add_runtime_dependency">add_runtime_dependency</a></li>

        <li ><a href="#method-i-add_self_to_load_path">add_self_to_load_path</a></li>

        <li ><a href="#method-i-author">author</a></li>

        <li ><a href="#method-i-author-3D">author=</a></li>

        <li ><a href="#method-i-authors">authors</a></li>

        <li ><a href="#method-i-authors-3D">authors=</a></li>

        <li ><a href="#method-i-base_dir">base_dir</a></li>

        <li ><a href="#method-i-bin_dir">bin_dir</a></li>

        <li ><a href="#method-i-bin_file">bin_file</a></li>

        <li ><a href="#method-i-build_args">build_args</a></li>

        <li ><a href="#method-i-build_info_dir">build_info_dir</a></li>

        <li ><a href="#method-i-build_info_file">build_info_file</a></li>

        <li ><a href="#method-i-cache_dir">cache_dir</a></li>

        <li ><a href="#method-i-cache_file">cache_file</a></li>

        <li ><a href="#method-i-conflicts">conflicts</a></li>

        <li ><a href="#method-i-date">date</a></li>

        <li ><a href="#method-i-date-3D">date=</a></li>

        <li ><a href="#method-i-default_value">default_value</a></li>

        <li ><a href="#method-i-dependencies">dependencies</a></li>

        <li ><a href="#method-i-dependent_gems">dependent_gems</a></li>

        <li ><a href="#method-i-dependent_specs">dependent_specs</a></li>

        <li ><a href="#method-i-description-3D">description=</a></li>

        <li ><a href="#method-i-development_dependencies">development_dependencies</a></li>

        <li ><a href="#method-i-doc_dir">doc_dir</a></li>

        <li ><a href="#method-i-executable">executable</a></li>

        <li ><a href="#method-i-executable-3D">executable=</a></li>

        <li ><a href="#method-i-executables">executables</a></li>

        <li ><a href="#method-i-executables-3D">executables=</a></li>

        <li ><a href="#method-i-extensions">extensions</a></li>

        <li ><a href="#method-i-extensions-3D">extensions=</a></li>

        <li class="calls-super" ><a href="#method-i-extensions_dir">extensions_dir</a></li>

        <li ><a href="#method-i-extra_rdoc_files">extra_rdoc_files</a></li>

        <li ><a href="#method-i-extra_rdoc_files-3D">extra_rdoc_files=</a></li>

        <li ><a href="#method-i-file_name">file_name</a></li>

        <li ><a href="#method-i-files">files</a></li>

        <li ><a href="#method-i-files-3D">files=</a></li>

        <li ><a href="#method-i-for_cache">for_cache</a></li>

        <li ><a href="#method-i-gems_dir">gems_dir</a></li>

        <li ><a href="#method-i-has_conflicts-3F">has_conflicts?</a></li>

        <li ><a href="#method-i-initialize_copy">initialize_copy</a></li>

        <li ><a href="#method-i-keep_only_files_and_directories">keep_only_files_and_directories</a></li>

        <li ><a href="#method-i-lib_files">lib_files</a></li>

        <li ><a href="#method-i-license">license</a></li>

        <li ><a href="#method-i-license-3D">license=</a></li>

        <li ><a href="#method-i-licenses">licenses</a></li>

        <li ><a href="#method-i-licenses-3D">licenses=</a></li>

        <li ><a href="#method-i-missing_extensions-3F">missing_extensions?</a></li>

        <li ><a href="#method-i-name_tuple">name_tuple</a></li>

        <li ><a href="#method-i-normalize">normalize</a></li>

        <li ><a href="#method-i-platform">platform</a></li>

        <li ><a href="#method-i-platform-3D">platform=</a></li>

        <li ><a href="#method-i-rdoc_options">rdoc_options</a></li>

        <li ><a href="#method-i-rdoc_options-3D">rdoc_options=</a></li>

        <li ><a href="#method-i-removed_method_calls">removed_method_calls</a></li>

        <li ><a href="#method-i-require_path">require_path</a></li>

        <li ><a href="#method-i-require_path-3D">require_path=</a></li>

        <li ><a href="#method-i-require_paths-3D">require_paths=</a></li>

        <li ><a href="#method-i-required_ruby_version-3D">required_ruby_version=</a></li>

        <li ><a href="#method-i-required_rubygems_version-3D">required_rubygems_version=</a></li>

        <li ><a href="#method-i-requirements">requirements</a></li>

        <li ><a href="#method-i-requirements-3D">requirements=</a></li>

        <li ><a href="#method-i-reset_nil_attributes_to_default">reset_nil_attributes_to_default</a></li>

        <li ><a href="#method-i-ri_dir">ri_dir</a></li>

        <li ><a href="#method-i-runtime_dependencies">runtime_dependencies</a></li>

        <li ><a href="#method-i-sanitize">sanitize</a></li>

        <li ><a href="#method-i-sanitize_string">sanitize_string</a></li>

        <li ><a href="#method-i-satisfies_requirement-3F">satisfies_requirement?</a></li>

        <li ><a href="#method-i-sort_obj">sort_obj</a></li>

        <li ><a href="#method-i-spec_dir">spec_dir</a></li>

        <li ><a href="#method-i-spec_file">spec_file</a></li>

        <li ><a href="#method-i-spec_name">spec_name</a></li>

        <li ><a href="#method-i-stubbed-3F">stubbed?</a></li>

        <li ><a href="#method-i-summary-3D">summary=</a></li>

        <li ><a href="#method-i-to_ruby">to_ruby</a></li>

        <li ><a href="#method-i-to_ruby_for_cache">to_ruby_for_cache</a></li>

        <li ><a href="#method-i-to_spec">to_spec</a></li>

        <li ><a href="#method-i-traverse">traverse</a></li>

        <li ><a href="#method-i-validate">validate</a></li>

        <li ><a href="#method-i-validate_for_resolution">validate_for_resolution</a></li>

        <li ><a href="#method-i-version-3D">version=</a></li>

      </ul>
    </details>
  </div>


  <div id="classindex-section" class="nav-section">
  <details class="nav-section-collapsible" open>
    <summary class="nav-section-header">
      <span class="nav-section-icon">
        <svg><use href="#icon-layers"></use></svg>
      </span>
      <span class="nav-section-title">Classes and Modules</span>
      <span class="nav-section-chevron">
        <svg><use href="#icon-chevron"></use></svg>
      </span>
    </summary>

    <ul class="link-list nav-list"><li><details open><summary><code><a href="../Gem.html">Gem</a></code></summary><ul class="link-list nav-list"><li><code><a href="../Gem/Specification.html">Specification</a></code></li></ul></details></li></ul>
  </details>
</div>

</nav>

<main role="main" aria-labelledby="class-gem-specification">
  
  
    <ol role="navigation" aria-label="Breadcrumb navigation" class="breadcrumb">
      
      <li>
        
        <a href="../Gem.html">Gem</a><span>::</span>
        
      </li>
      
      <li>
        
        <span>Specification</span>
        
      </li>
      
    </ol>
  

  <span id="class-Gem::Specification" class="legacy-anchor"></span>
  <h1 id="class-gem-specification" class="anchor-link class">
    class Gem::Specification
  </h1>

  <section class="description">
    
<p>The <a href="Specification.html"><code>Specification</code></a> class contains the information for a gem.  Typically defined in a .gemspec file or a Rakefile, and looks like this:</p>

<pre class="ruby"><span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Specification</span>.<span class="ruby-identifier">new</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">s</span><span class="ruby-operator">|</span>
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">name</span>        = <span class="ruby-string">&#39;example&#39;</span>
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">version</span>     = <span class="ruby-string">&#39;0.1.0&#39;</span>
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">licenses</span>    = [<span class="ruby-string">&#39;MIT&#39;</span>]
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">summary</span>     = <span class="ruby-string">&quot;This is an example!&quot;</span>
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">description</span> = <span class="ruby-string">&quot;Much longer explanation of the example!&quot;</span>
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">authors</span>     = [<span class="ruby-string">&quot;Ruby Coder&quot;</span>]
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">email</span>       = <span class="ruby-string">&#39;rubycoder@example.com&#39;</span>
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">files</span>       = [<span class="ruby-string">&quot;lib/example.rb&quot;</span>]
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">homepage</span>    = <span class="ruby-string">&#39;https://rubygems.org/gems/example&#39;</span>
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">metadata</span>    = { <span class="ruby-string">&quot;source_code_uri&quot;</span> <span class="ruby-operator">=&gt;</span> <span class="ruby-string">&quot;https://github.com/example/example&quot;</span> }
<span class="ruby-keyword">end</span>
</pre>

<p>Starting in RubyGems 2.0, a <a href="Specification.html"><code>Specification</code></a> can hold arbitrary metadata.  See <a href="Specification.html#attribute-i-metadata"><code>metadata</code></a> for restrictions on the format and size of metadata items you may add to a specification.</p>

  </section>


  <span id="5Buntitled-5D" class="legacy-anchor"></span>
  <section id="untitled" class="documentation-section anchor-link">





    <section class="constants-list">
      <header>
        <h3 id="constants"><a href="#constants">Constants</a></h3>
      </header>
      <dl>

        <dt id="NONEXISTENT_SPECIFICATION_VERSION">NONEXISTENT_SPECIFICATION_VERSION</dt>

        <dd>

          <p>The version number of a specification that does not specify one (i.e. RubyGems 0.7 or earlier).</p>
        </dd>


      </dl>
    </section>














     <section id="public-instance-untitled-method-details" class="method-section anchor-link">
       <header>
         <h3 id="public-instance-methods"><a href="#public-instance-methods">Public Instance Methods</a></h3>
       </header>


      <div id="method-i-removed_method_calls" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-removed_method_calls" title="Link to this method">
                <span class="method-name">removed_method_calls</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="removed_method_calls-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 186</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">removed_method_calls</span>
  <span class="ruby-ivar">@removed_method_calls</span> <span class="ruby-operator">||=</span> []
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          


        </div>





      </div>


    </section>




  </section>

  <span id="Optional+gemspec+attributes" class="legacy-anchor"></span>
  <section id="optional-gemspec-attributes" class="documentation-section anchor-link">

    <header class="documentation-section-title">
      <h2>
        <a href="#optional-gemspec-attributes">Optional gemspec attributes</a>
      </h2>
    </header>





    <section class="constants-list">
      <header>
        <h3 id="constants"><a href="#constants">Constants</a></h3>
      </header>
      <dl>

        <dt id="LATEST_RUBY_WITHOUT_PATCH_VERSIONS">LATEST_RUBY_WITHOUT_PATCH_VERSIONS</dt>

        <dd>

          
        </dd>


      </dl>
    </section>



    <section class="attribute-method-details method-section">
      <header>
        <h3 id="attributes"><a href="#attributes">Attributes</a></h3>
      </header>


      <div id="attribute-i-bindir" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-bindir" title="Link to this attribute">
            <span class="method-name">bindir</span>
            <span class="attribute-access-type">[RW]</span>
          </a>
        </div>

        <div class="method-description">


        <p>The path in the gem for executable scripts.  Usually ‘exe’</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">bindir</span> = <span class="ruby-string">&#39;exe&#39;</span>
</pre>

        </div>
      </div>

      <div id="attribute-i-cert_chain" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-cert_chain" title="Link to this attribute">
            <span class="method-name">cert_chain</span>
            <span class="attribute-access-type">[RW]</span>
          </a>
        </div>

        <div class="method-description">


        <p>The certificate chain used to sign this gem.  See Gem::Security for details.</p>

        </div>
      </div>

      <div id="attribute-i-post_install_message" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-post_install_message" title="Link to this attribute">
            <span class="method-name">post_install_message</span>
            <span class="attribute-access-type">[RW]</span>
          </a>
        </div>

        <div class="method-description">


        <p>A message that gets displayed after the gem is installed.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">post_install_message</span> = <span class="ruby-string">&quot;Thanks for installing!&quot;</span>
</pre>

        </div>
      </div>

      <div id="attribute-i-required_rubygems_version" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-required_rubygems_version" title="Link to this attribute">
            <span class="method-name">required_rubygems_version</span>
            <span class="attribute-access-type">[R]</span>
          </a>
        </div>

        <div class="method-description">


        <p>The RubyGems version required by this gem</p>

        </div>
      </div>

      <div id="attribute-i-signing_key" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-signing_key" title="Link to this attribute">
            <span class="method-name">signing_key</span>
            <span class="attribute-access-type">[RW]</span>
          </a>
        </div>

        <div class="method-description">


        <p>The key used to sign this gem.  See Gem::Security for details.</p>

        </div>
      </div>

    </section>












     <section id="public-instance-optional-gemspec-attributes-method-details" class="method-section anchor-link">
       <header>
         <h3 id="public-instance-methods"><a href="#public-instance-methods">Public Instance Methods</a></h3>
       </header>


      <div id="method-i-add_dependency" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-add_dependency" title="Link to this method">
                <span class="method-name">add_dependency</span>
                <span class="method-args">(gem, *requirements)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="add_dependency-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 543</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">add_dependency</span>(<span class="ruby-identifier">gem</span>, <span class="ruby-operator">*</span><span class="ruby-identifier">requirements</span>)
  <span class="ruby-keyword">if</span> <span class="ruby-identifier">requirements</span>.<span class="ruby-identifier">uniq</span>.<span class="ruby-identifier">size</span> <span class="ruby-operator">!=</span> <span class="ruby-identifier">requirements</span>.<span class="ruby-identifier">size</span>
    <span class="ruby-identifier">warn</span> <span class="ruby-node">&quot;WARNING: duplicated #{gem} dependency #{requirements}&quot;</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-identifier">add_dependency_with_type</span>(<span class="ruby-identifier">gem</span>, <span class="ruby-value">:runtime</span>, <span class="ruby-identifier">requirements</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Adds a runtime dependency named <code>gem</code> with <code>requirements</code> to this gem.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">add_dependency</span> <span class="ruby-string">&#39;example&#39;</span>, <span class="ruby-string">&#39;~&gt; 1.1&#39;</span>, <span class="ruby-string">&#39;&gt;= 1.1.4&#39;</span>
</pre>


        </div>



        <div class="aliases">
          Also aliased as: <a href="Specification.html#method-i-add_runtime_dependency">add_runtime_dependency</a>
        </div>



      </div>


      <div id="method-i-add_development_dependency" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-add_development_dependency" title="Link to this method">
                <span class="method-name">add_development_dependency</span>
                <span class="method-args">(gem, *requirements)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="add_development_dependency-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 532</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">add_development_dependency</span>(<span class="ruby-identifier">gem</span>, <span class="ruby-operator">*</span><span class="ruby-identifier">requirements</span>)
  <span class="ruby-identifier">add_dependency_with_type</span>(<span class="ruby-identifier">gem</span>, <span class="ruby-value">:development</span>, <span class="ruby-identifier">requirements</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Adds a development dependency named <code>gem</code> with <code>requirements</code> to this gem.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">add_development_dependency</span> <span class="ruby-string">&#39;example&#39;</span>, <span class="ruby-string">&#39;~&gt; 1.1&#39;</span>, <span class="ruby-string">&#39;&gt;= 1.1.4&#39;</span>
</pre>

<p>Development dependencies aren’t installed by default and aren’t activated when a gem is required.</p>


        </div>





      </div>


      <div id="method-i-author-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-author-3D" title="Link to this method">
                <span class="method-name">author=</span>
                <span class="method-args">(o)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="author-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 412</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">author=</span>(<span class="ruby-identifier">o</span>)
  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">authors</span> = [<span class="ruby-identifier">o</span>]
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Singular (alternative) writer for <a href="Specification.html#method-i-authors"><code>authors</code></a></p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">author</span> = <span class="ruby-string">&#39;John Jones&#39;</span>
</pre>


        </div>





      </div>


      <div id="method-i-executables" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-executables" title="Link to this method">
                <span class="method-name">executables</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="executables-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 566</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">executables</span>
  <span class="ruby-ivar">@executables</span> <span class="ruby-operator">||=</span> []
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Executables included in the gem.</p>

<p>For example, the rake gem has rake as an executable. You don’t specify the full path (as in bin/rake); all application-style files are expected to be found in bindir.  These files must be executable Ruby files.  Files that use bash or other interpreters will not work.</p>

<p>Executables included may only be ruby scripts, not scripts for other languages or compiled binaries.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">executables</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&#39;rake&#39;</span>
</pre>


        </div>





      </div>


      <div id="method-i-extensions" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-extensions" title="Link to this method">
                <span class="method-name">extensions</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="extensions-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 583</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">extensions</span>
  <span class="ruby-ivar">@extensions</span> <span class="ruby-operator">||=</span> []
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Extensions to build when installing the gem, specifically the paths to extconf.rb-style files used to compile extensions.</p>

<p>These files will be run when the gem is installed, causing the C (or whatever) code to be compiled on the user’s machine.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">extensions</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&#39;ext/rmagic/extconf.rb&#39;</span>
</pre>

<p>See Gem::Ext::Builder for information about writing extensions for gems.</p>


        </div>





      </div>


      <div id="method-i-extra_rdoc_files" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-extra_rdoc_files" title="Link to this method">
                <span class="method-name">extra_rdoc_files</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="extra_rdoc_files-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 599</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">extra_rdoc_files</span>
  <span class="ruby-ivar">@extra_rdoc_files</span> <span class="ruby-operator">||=</span> []
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Extra files to add to RDoc such as README or doc/examples.txt</p>

<p>When the user elects to generate the RDoc documentation for a gem (typically at install time), all the library files are sent to RDoc for processing. This option allows you to have some non-code files included for a more complete set of documentation.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">extra_rdoc_files</span> = [<span class="ruby-string">&#39;README&#39;</span>, <span class="ruby-string">&#39;doc/user-guide.txt&#39;</span>]
</pre>


        </div>





      </div>


      <div id="method-i-platform-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-platform-3D" title="Link to this method">
                <span class="method-name">platform=</span>
                <span class="method-args">(platform)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="platform-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 463</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">platform=</span>(<span class="ruby-identifier">platform</span>)
  <span class="ruby-ivar">@original_platform</span> = <span class="ruby-identifier">platform</span>

  <span class="ruby-keyword">case</span> <span class="ruby-identifier">platform</span>
  <span class="ruby-keyword">when</span> <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span><span class="ruby-operator">::</span><span class="ruby-constant">CURRENT</span> <span class="ruby-keyword">then</span>
    <span class="ruby-ivar">@new_platform</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span>.<span class="ruby-identifier">local</span>
    <span class="ruby-ivar">@original_platform</span> = <span class="ruby-ivar">@new_platform</span>.<span class="ruby-identifier">to_s</span>

  <span class="ruby-keyword">when</span> <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span> <span class="ruby-keyword">then</span>
    <span class="ruby-ivar">@new_platform</span> = <span class="ruby-identifier">platform</span>

  <span class="ruby-comment"># legacy constants</span>
  <span class="ruby-keyword">when</span> <span class="ruby-keyword">nil</span>, <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span><span class="ruby-operator">::</span><span class="ruby-constant">RUBY</span> <span class="ruby-keyword">then</span>
    <span class="ruby-ivar">@new_platform</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span><span class="ruby-operator">::</span><span class="ruby-constant">RUBY</span>
  <span class="ruby-keyword">when</span> <span class="ruby-string">&quot;mswin32&quot;</span> <span class="ruby-keyword">then</span> <span class="ruby-comment"># was Gem::Platform::WIN32</span>
    <span class="ruby-ivar">@new_platform</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span>.<span class="ruby-identifier">new</span> <span class="ruby-string">&quot;x86-mswin32&quot;</span>
  <span class="ruby-keyword">when</span> <span class="ruby-string">&quot;i586-linux&quot;</span> <span class="ruby-keyword">then</span> <span class="ruby-comment"># was Gem::Platform::LINUX_586</span>
    <span class="ruby-ivar">@new_platform</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span>.<span class="ruby-identifier">new</span> <span class="ruby-string">&quot;x86-linux&quot;</span>
  <span class="ruby-keyword">when</span> <span class="ruby-string">&quot;powerpc-darwin&quot;</span> <span class="ruby-keyword">then</span> <span class="ruby-comment"># was Gem::Platform::DARWIN</span>
    <span class="ruby-ivar">@new_platform</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span>.<span class="ruby-identifier">new</span> <span class="ruby-string">&quot;ppc-darwin&quot;</span>
  <span class="ruby-keyword">else</span>
    <span class="ruby-ivar">@new_platform</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span>.<span class="ruby-identifier">new</span> <span class="ruby-identifier">platform</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-ivar">@platform</span> = <span class="ruby-ivar">@new_platform</span>.<span class="ruby-identifier">to_s</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>The platform this gem runs on.</p>

<p>This is usually Gem::Platform::RUBY or Gem::Platform::CURRENT.</p>

<p>Most gems contain pure Ruby code; they should simply leave the default value in place.  Some gems contain C (or other) code to be compiled into a Ruby “extension”.  The gem should leave the default value in place unless the code will only compile on a certain type of system.  Some gems consist of pre-compiled code (“binary gems”).  It’s especially important that they set the platform attribute appropriately.  A shortcut is to set the platform to Gem::Platform::CURRENT, which will cause the gem builder to set the platform to the appropriate value for the system on which the build is being performed.</p>

<p>If this attribute is set to a non-default value, it will be included in the filename of the gem when it is built such as: nokogiri-1.6.0-x86-mingw32.gem</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">platform</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span>.<span class="ruby-identifier">local</span>
</pre>


        </div>





      </div>


      <div id="method-i-rdoc_options" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-rdoc_options" title="Link to this method">
                <span class="method-name">rdoc_options</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="rdoc_options-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 629</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">rdoc_options</span>
  <span class="ruby-ivar">@rdoc_options</span> <span class="ruby-operator">||=</span> []
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Specifies the rdoc options to be used when generating API documentation.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">rdoc_options</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&#39;--title&#39;</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&#39;Rake -- Ruby Make&#39;</span> <span class="ruby-operator">&lt;&lt;</span>
  <span class="ruby-string">&#39;--main&#39;</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&#39;README&#39;</span> <span class="ruby-operator">&lt;&lt;</span>
  <span class="ruby-string">&#39;--line-numbers&#39;</span>
</pre>


        </div>





      </div>


      <div id="method-i-require_paths-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-require_paths-3D" title="Link to this method">
                <span class="method-name">require_paths=</span>
                <span class="method-args">(val)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="require_paths-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 507</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">require_paths=</span>(<span class="ruby-identifier">val</span>)
  <span class="ruby-ivar">@require_paths</span> = <span class="ruby-constant">Array</span>(<span class="ruby-identifier">val</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Paths in the gem to add to <code>$LOAD_PATH</code> when this gem is activated. If you have an extension you do not need to add <code>&quot;ext&quot;</code> to the require path, the extension build process will copy the extension files into “lib” for you.</p>

<p>The default value is <code>&quot;lib&quot;</code></p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-comment"># If all library files are in the root directory...</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">require_paths</span> = [<span class="ruby-string">&#39;.&#39;</span>]
</pre>


        </div>





      </div>


      <div id="method-i-required_ruby_version-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-required_ruby_version-3D" title="Link to this method">
                <span class="method-name">required_ruby_version=</span>
                <span class="method-args">(req)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="required_ruby_version-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 659</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">required_ruby_version=</span>(<span class="ruby-identifier">req</span>)
  <span class="ruby-ivar">@required_ruby_version</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Requirement</span>.<span class="ruby-identifier">create</span> <span class="ruby-identifier">req</span>

  <span class="ruby-ivar">@required_ruby_version</span>.<span class="ruby-identifier">requirements</span>.<span class="ruby-identifier">map!</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">op</span>, <span class="ruby-identifier">v</span><span class="ruby-operator">|</span>
    <span class="ruby-keyword">if</span> <span class="ruby-identifier">v</span> <span class="ruby-operator">&gt;=</span> <span class="ruby-constant">LATEST_RUBY_WITHOUT_PATCH_VERSIONS</span> <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-identifier">v</span>.<span class="ruby-identifier">release</span>.<span class="ruby-identifier">segments</span>.<span class="ruby-identifier">size</span> <span class="ruby-operator">==</span> <span class="ruby-value">4</span>
      [<span class="ruby-identifier">op</span> <span class="ruby-operator">==</span> <span class="ruby-string">&quot;~&gt;&quot;</span> <span class="ruby-operator">?</span> <span class="ruby-string">&quot;=&quot;</span> <span class="ruby-operator">:</span> <span class="ruby-identifier">op</span>, <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Version</span>.<span class="ruby-identifier">new</span>(<span class="ruby-identifier">v</span>.<span class="ruby-identifier">segments</span>.<span class="ruby-identifier">tap</span> {<span class="ruby-operator">|</span><span class="ruby-identifier">s</span><span class="ruby-operator">|</span> <span class="ruby-identifier">s</span>.<span class="ruby-identifier">delete_at</span>(<span class="ruby-value">3</span>) }.<span class="ruby-identifier">join</span>(<span class="ruby-string">&quot;.&quot;</span>))]
    <span class="ruby-keyword">else</span>
      [<span class="ruby-identifier">op</span>, <span class="ruby-identifier">v</span>]
    <span class="ruby-keyword">end</span>
  <span class="ruby-keyword">end</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>The version of Ruby required by this gem.  The ruby version can be specified to the patch-level:</p>

<pre>$ ruby -v -e &#39;p Gem.ruby_version&#39;
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
#&lt;Gem::Version &quot;2.0.0.247&quot;&gt;</pre>

<p>Prereleases can also be specified.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-comment"># This gem will work with 1.8.6 or greater...</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">required_ruby_version</span> = <span class="ruby-string">&#39;&gt;= 1.8.6&#39;</span>

<span class="ruby-comment"># Only with final releases of major version 2 where minor version is at least 3</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">required_ruby_version</span> = <span class="ruby-string">&#39;~&gt; 2.3&#39;</span>

<span class="ruby-comment"># Only prereleases or final releases after 2.6.0.preview2</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">required_ruby_version</span> = <span class="ruby-string">&#39;&gt; 2.6.0.preview2&#39;</span>

<span class="ruby-comment"># This gem will work with 2.3.0 or greater, including major version 3, but lesser than 4.0.0</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">required_ruby_version</span> = <span class="ruby-string">&#39;&gt;= 2.3&#39;</span>, <span class="ruby-string">&#39;&lt; 4&#39;</span>
</pre>


        </div>





      </div>


      <div id="method-i-required_rubygems_version-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-required_rubygems_version-3D" title="Link to this method">
                <span class="method-name">required_rubygems_version=</span>
                <span class="method-args">(req)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="required_rubygems_version-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 674</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">required_rubygems_version=</span>(<span class="ruby-identifier">req</span>)
  <span class="ruby-ivar">@required_rubygems_version</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Requirement</span>.<span class="ruby-identifier">create</span> <span class="ruby-identifier">req</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>The RubyGems version required by this gem</p>


        </div>





      </div>


      <div id="method-i-requirements" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-requirements" title="Link to this method">
                <span class="method-name">requirements</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="requirements-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 687</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">requirements</span>
  <span class="ruby-ivar">@requirements</span> <span class="ruby-operator">||=</span> []
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Lists the external (to RubyGems) requirements that must be met for this gem to work.  It’s simply information for the user.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">requirements</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&#39;libmagick, v6.0&#39;</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">requirements</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&#39;A good graphics card&#39;</span>
</pre>


        </div>





      </div>


    </section>




  </section>

  <span id="Read-only+attributes" class="legacy-anchor"></span>
  <section id="read-only-attributes" class="documentation-section anchor-link">

    <header class="documentation-section-title">
      <h2>
        <a href="#read-only-attributes">Read-only attributes</a>
      </h2>
    </header>







    <section class="attribute-method-details method-section">
      <header>
        <h3 id="attributes"><a href="#attributes">Attributes</a></h3>
      </header>


      <div id="attribute-i-rubygems_version" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-rubygems_version" title="Link to this attribute">
            <span class="method-name">rubygems_version</span>
            <span class="attribute-access-type">[RW]</span>
          </a>
        </div>

        <div class="method-description">


        <p>The version of RubyGems used to create this gem.</p>

        </div>
      </div>

    </section>












     <section id="public-instance-read-only-attributes-method-details" class="method-section anchor-link">
       <header>
         <h3 id="public-instance-methods"><a href="#public-instance-methods">Public Instance Methods</a></h3>
       </header>


      <div id="method-i-extensions_dir" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-extensions_dir" title="Link to this method">
                <span class="method-name">extensions_dir</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="extensions_dir-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 714</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">extensions_dir</span>
  <span class="ruby-ivar">@extensions_dir</span> <span class="ruby-operator">||=</span> <span class="ruby-keyword">super</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>The path where this gem installs its extensions.</p>


            <div class="method-calls-super">
              Calls superclass method
              
            </div>

        </div>





      </div>


    </section>




  </section>

  <span id="Recommended+gemspec+attributes" class="legacy-anchor"></span>
  <section id="recommended-gemspec-attributes" class="documentation-section anchor-link">

    <header class="documentation-section-title">
      <h2>
        <a href="#recommended-gemspec-attributes">Recommended gemspec attributes</a>
      </h2>
    </header>







    <section class="attribute-method-details method-section">
      <header>
        <h3 id="attributes"><a href="#attributes">Attributes</a></h3>
      </header>


      <div id="attribute-i-description" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-description" title="Link to this attribute">
            <span class="method-name">description</span>
            <span class="attribute-access-type">[R]</span>
          </a>
        </div>

        <div class="method-description">


        <p>A long description of this gem</p>

<p>The description should be more detailed than the summary but not excessively long.  A few paragraphs is a recommended length with no examples or formatting.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">description</span> = <span class="ruby-identifier">&lt;&lt;~EOF</span>
<span class="ruby-value">  Rake is a Make-like program implemented in Ruby. Tasks and
  dependencies are specified in standard Ruby syntax.</span>
<span class="ruby-identifier">EOF</span>
</pre>

        </div>
      </div>

      <div id="attribute-i-email" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-email" title="Link to this attribute">
            <span class="method-name">email</span>
            <span class="attribute-access-type">[RW]</span>
          </a>
        </div>

        <div class="method-description">


        <p>A contact email address (or addresses) for this gem</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">email</span> = <span class="ruby-string">&#39;john.jones@example.com&#39;</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">email</span> = [<span class="ruby-string">&#39;jack@example.com&#39;</span>, <span class="ruby-string">&#39;jill@example.com&#39;</span>]
</pre>

        </div>
      </div>

      <div id="attribute-i-homepage" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-homepage" title="Link to this attribute">
            <span class="method-name">homepage</span>
            <span class="attribute-access-type">[RW]</span>
          </a>
        </div>

        <div class="method-description">


        <p>The URL of this gem’s home page</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">homepage</span> = <span class="ruby-string">&#39;https://github.com/ruby/rake&#39;</span>
</pre>

        </div>
      </div>

      <div id="attribute-i-metadata" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-metadata" title="Link to this attribute">
            <span class="method-name">metadata</span>
            <span class="attribute-access-type">[RW]</span>
          </a>
        </div>

        <div class="method-description">


        <p>The metadata holds extra data for this gem that may be useful to other consumers and is settable by gem authors.</p>

<p>Metadata items have the following restrictions:</p>
<ul><li>
<p>The metadata must be a Hash object</p>
</li><li>
<p>All keys and values must be Strings</p>
</li><li>
<p>Keys can be a maximum of 128 bytes and values can be a maximum of 1024 bytes</p>
</li><li>
<p>All strings must be UTF-8, no binary data is allowed</p>
</li></ul>

<p>You can use metadata to specify links to your gem’s homepage, codebase, documentation, wiki, mailing list, issue tracker and changelog.</p>

<pre class="ruby"><span class="ruby-identifier">s</span>.<span class="ruby-identifier">metadata</span> = {
  <span class="ruby-string">&quot;bug_tracker_uri&quot;</span>   <span class="ruby-operator">=&gt;</span> <span class="ruby-string">&quot;https://example.com/user/bestgemever/issues&quot;</span>,
  <span class="ruby-string">&quot;changelog_uri&quot;</span>     <span class="ruby-operator">=&gt;</span> <span class="ruby-string">&quot;https://example.com/user/bestgemever/CHANGELOG.md&quot;</span>,
  <span class="ruby-string">&quot;documentation_uri&quot;</span> <span class="ruby-operator">=&gt;</span> <span class="ruby-string">&quot;https://www.example.info/gems/bestgemever/0.0.1&quot;</span>,
  <span class="ruby-string">&quot;homepage_uri&quot;</span>      <span class="ruby-operator">=&gt;</span> <span class="ruby-string">&quot;https://bestgemever.example.io&quot;</span>,
  <span class="ruby-string">&quot;mailing_list_uri&quot;</span>  <span class="ruby-operator">=&gt;</span> <span class="ruby-string">&quot;https://groups.example.com/bestgemever&quot;</span>,
  <span class="ruby-string">&quot;source_code_uri&quot;</span>   <span class="ruby-operator">=&gt;</span> <span class="ruby-string">&quot;https://example.com/user/bestgemever&quot;</span>,
  <span class="ruby-string">&quot;wiki_uri&quot;</span>          <span class="ruby-operator">=&gt;</span> <span class="ruby-string">&quot;https://example.com/user/bestgemever/wiki&quot;</span>,
  <span class="ruby-string">&quot;funding_uri&quot;</span>       <span class="ruby-operator">=&gt;</span> <span class="ruby-string">&quot;https://example.com/donate&quot;</span>
}
</pre>

<p>These links will be used on your gem’s page on rubygems.org and must pass validation against following regex.</p>

<pre class="ruby"><span class="ruby-regexp">%r{\Ahttps?:\/\/([^\s:@]+:[^\s:@]*@)?[A-Za-z\d\-]+(\.[A-Za-z\d\-]+)+\.?(:\d{1,5})?([\/?]\S*)?\z}</span>
</pre>

        </div>
      </div>

      <div id="attribute-i-required_ruby_version" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-required_ruby_version" title="Link to this attribute">
            <span class="method-name">required_ruby_version</span>
            <span class="attribute-access-type">[R]</span>
          </a>
        </div>

        <div class="method-description">


        <p>The version of Ruby required by this gem</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">required_ruby_version</span> = <span class="ruby-string">&#39;&gt;= 2.7.0&#39;</span>
</pre>

        </div>
      </div>

    </section>












     <section id="public-instance-recommended-gemspec-attributes-method-details" class="method-section anchor-link">
       <header>
         <h3 id="public-instance-methods"><a href="#public-instance-methods">Public Instance Methods</a></h3>
       </header>


      <div id="method-i-license-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-license-3D" title="Link to this method">
                <span class="method-name">license=</span>
                <span class="method-args">(o)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="license-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 348</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">license=</span>(<span class="ruby-identifier">o</span>)
  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">licenses</span> = [<span class="ruby-identifier">o</span>]
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>The license for this gem.</p>

<p>The license must be no more than 64 characters.</p>

<p>This should just be the name of your license. The full text of the license should be inside of the gem (at the top level) when you build it.</p>

<p>The simplest way is to specify the standard SPDX ID <a href="https://spdx.org/licenses">spdx.org/licenses</a>/ for the license. Ideally, you should pick one that is OSI (Open Source Initiative) <a href="https://opensource.org/licenses">opensource.org/licenses</a>/ approved.</p>

<p>The most commonly used OSI-approved licenses are MIT and Apache-2.0. GitHub also provides a license picker at <a href="https://choosealicense.com">choosealicense.com</a>/.</p>

<p>You can also use a custom license file along with your gemspec and specify a LicenseRef-&lt;idstring&gt;, where idstring is the name of the file containing the license text.</p>

<p>You should specify a license for your gem so that people know how they are permitted to use it and any restrictions you’re placing on it.  Not specifying a license means all rights are reserved; others have no right to use the code for any purpose.</p>

<p>You can set multiple licenses with <a href="Specification.html#method-i-licenses-3D"><code>licenses=</code></a></p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">license</span> = <span class="ruby-string">&#39;MIT&#39;</span>
</pre>


        </div>





      </div>


      <div id="method-i-licenses-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-licenses-3D" title="Link to this method">
                <span class="method-name">licenses=</span>
                <span class="method-args">(licenses)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="licenses-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 365</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">licenses=</span>(<span class="ruby-identifier">licenses</span>)
  <span class="ruby-ivar">@licenses</span> = <span class="ruby-constant">Array</span> <span class="ruby-identifier">licenses</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>The license(s) for the library.</p>

<p>Each license must be a short name, no more than 64 characters.</p>

<p>This should just be the name of your license. The full text of the license should be inside of the gem when you build it.</p>

<p>See <a href="Specification.html#method-i-license-3D"><code>license=</code></a> for more discussion</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">licenses</span> = [<span class="ruby-string">&#39;MIT&#39;</span>, <span class="ruby-string">&#39;GPL-2.0&#39;</span>]
</pre>


        </div>





      </div>


    </section>




  </section>

  <span id="Required+gemspec+attributes" class="legacy-anchor"></span>
  <section id="required-gemspec-attributes" class="documentation-section anchor-link">

    <header class="documentation-section-title">
      <h2>
        <a href="#required-gemspec-attributes">Required gemspec attributes</a>
      </h2>
    </header>







    <section class="attribute-method-details method-section">
      <header>
        <h3 id="attributes"><a href="#attributes">Attributes</a></h3>
      </header>


      <div id="attribute-i-name" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-name" title="Link to this attribute">
            <span class="method-name">name</span>
            <span class="attribute-access-type">[RW]</span>
          </a>
        </div>

        <div class="method-description">


        <p>This gem’s name.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">name</span> = <span class="ruby-string">&#39;rake&#39;</span>
</pre>

        </div>
      </div>

      <div id="attribute-i-summary" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-summary" title="Link to this attribute">
            <span class="method-name">summary</span>
            <span class="attribute-access-type">[R]</span>
          </a>
        </div>

        <div class="method-description">


        <p>A short summary of this gem’s description.  Displayed in <code>gem list -d</code>.</p>

<p>The <a href="Specification.html#attribute-i-description"><code>description</code></a> should be more detailed than the summary.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">summary</span> = <span class="ruby-string">&quot;This is a small summary of my gem&quot;</span>
</pre>

        </div>
      </div>

      <div id="attribute-i-version" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-version" title="Link to this attribute">
            <span class="method-name">version</span>
            <span class="attribute-access-type">[R]</span>
          </a>
        </div>

        <div class="method-description">


        <p>This gem’s version.</p>

<p>The version string can contain numbers and periods, such as <code>1.0.0</code>. A gem is a ‘prerelease’ gem if the version has a letter in it, such as <code>1.0.0.pre</code>.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">version</span> = <span class="ruby-string">&#39;0.4.1&#39;</span>
</pre>

        </div>
      </div>

    </section>












     <section id="public-instance-required-gemspec-attributes-method-details" class="method-section anchor-link">
       <header>
         <h3 id="public-instance-methods"><a href="#public-instance-methods">Public Instance Methods</a></h3>
       </header>


      <div id="method-i-authors-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-authors-3D" title="Link to this method">
                <span class="method-name">authors=</span>
                <span class="method-args">(value)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="authors-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 267</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">authors=</span>(<span class="ruby-identifier">value</span>)
  <span class="ruby-ivar">@authors</span> = <span class="ruby-constant">Array</span>(<span class="ruby-identifier">value</span>).<span class="ruby-identifier">flatten</span>.<span class="ruby-identifier">grep</span>(<span class="ruby-constant">String</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>A list of authors for this gem.</p>

<p>Alternatively, a single author can be specified by assigning a string to <code>spec.author</code></p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">authors</span> = [<span class="ruby-string">&#39;John Jones&#39;</span>, <span class="ruby-string">&#39;Mary Smith&#39;</span>]
</pre>


        </div>





      </div>


      <div id="method-i-files" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-files" title="Link to this method">
                <span class="method-name">files</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="files-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 247</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">files</span>
  <span class="ruby-comment"># DO NOT CHANGE TO ||= ! This is not a normal accessor. (yes, it sucks)</span>
  <span class="ruby-comment"># DOC: Why isn&#39;t it normal? Why does it suck? How can we fix this?</span>
  <span class="ruby-ivar">@files</span> = [<span class="ruby-ivar">@files</span>,
            <span class="ruby-ivar">@test_files</span>,
            <span class="ruby-identifier">add_bindir</span>(<span class="ruby-ivar">@executables</span>),
            <span class="ruby-ivar">@extra_rdoc_files</span>,
            <span class="ruby-ivar">@extensions</span>].<span class="ruby-identifier">flatten</span>.<span class="ruby-identifier">compact</span>.<span class="ruby-identifier">uniq</span>.<span class="ruby-identifier">sort</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Files included in this gem.  You cannot append to this accessor, you must assign to it.</p>

<p>Only add files you can require to this list, not directories, etc.</p>

<p>Directories are automatically stripped from this list when building a gem, other non-files cause an error.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">require</span> <span class="ruby-string">&#39;rake&#39;</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">files</span> = <span class="ruby-constant">FileList</span>[<span class="ruby-string">&#39;lib/**/*.rb&#39;</span>,
                      <span class="ruby-string">&#39;bin/*&#39;</span>,
                      <span class="ruby-string">&#39;[A-Z]*&#39;</span>].<span class="ruby-identifier">to_a</span>

<span class="ruby-comment"># or without Rake...</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">files</span> = <span class="ruby-constant">Dir</span>[<span class="ruby-string">&#39;lib/**/*.rb&#39;</span>] <span class="ruby-operator">+</span> <span class="ruby-constant">Dir</span>[<span class="ruby-string">&#39;bin/*&#39;</span>]
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">files</span> <span class="ruby-operator">+=</span> <span class="ruby-constant">Dir</span>[<span class="ruby-string">&#39;[A-Z]*&#39;</span>]
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">files</span>.<span class="ruby-identifier">reject!</span> { <span class="ruby-operator">|</span><span class="ruby-identifier">fn</span><span class="ruby-operator">|</span> <span class="ruby-identifier">fn</span>.<span class="ruby-identifier">include?</span> <span class="ruby-string">&quot;CVS&quot;</span> }
</pre>


        </div>





      </div>


    </section>




  </section>

  <span id="Specification+internals" class="legacy-anchor"></span>
  <section id="specification-internals" class="documentation-section anchor-link">

    <header class="documentation-section-title">
      <h2>
        <a href="#specification-internals">Specification internals</a>
      </h2>
    </header>







    <section class="attribute-method-details method-section">
      <header>
        <h3 id="attributes"><a href="#attributes">Attributes</a></h3>
      </header>


      <div id="attribute-i-activated" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-activated" title="Link to this attribute">
            <span class="method-name">activated</span>
            <span class="attribute-access-type">[RW]</span>
          </a>
        </div>

        <div class="method-description">


        <p>True when this gemspec has been activated. This attribute is not persisted.</p>

        </div>
      </div>

      <div id="attribute-i-activated-3F" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-activated-3F" title="Link to this attribute">
            <span class="method-name">activated?</span>
            <span class="attribute-access-type">[RW]</span>
          </a>
        </div>

        <div class="method-description">


        <p>True when this gemspec has been activated. This attribute is not persisted.</p>

        </div>
      </div>

      <div id="attribute-i-specification_version" class="method-detail anchor-link">
        <div class="method-heading attribute-method-heading">
          <a href="#attribute-i-specification_version" title="Link to this attribute">
            <span class="method-name">specification_version</span>
            <span class="attribute-access-type">[RW]</span>
          </a>
        </div>

        <div class="method-description">


        <p>The <a href="Specification.html"><code>Gem::Specification</code></a> version of this gemspec.</p>

<p>Do not set this, it is set automatically when the gem is packaged.</p>

        </div>
      </div>

    </section>






     <section id="public-class-specification-internals-method-details" class="method-section anchor-link">
       <header>
         <h3 id="public-class-methods"><a href="#public-class-methods">Public Class Methods</a></h3>
       </header>


      <div id="method-c-_load" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-_load" title="Link to this method">
                <span class="method-name">_load</span>
                <span class="method-args">(str)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="_load-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1232</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">_load</span>(<span class="ruby-identifier">str</span>)
  <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">load_yaml</span>
  <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">load_safe_marshal</span>

  <span class="ruby-identifier">yaml_set</span> = <span class="ruby-keyword">false</span>
  <span class="ruby-identifier">retry_count</span> = <span class="ruby-value">0</span>

  <span class="ruby-identifier">array</span> = <span class="ruby-keyword">begin</span>
    <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">SafeMarshal</span>.<span class="ruby-identifier">safe_load</span> <span class="ruby-identifier">str</span>
  <span class="ruby-keyword">rescue</span> <span class="ruby-constant">ArgumentError</span> <span class="ruby-operator">=&gt;</span> <span class="ruby-identifier">e</span>
    <span class="ruby-comment"># Avoid an infinite retry loop when the argument error has nothing to do</span>
    <span class="ruby-comment"># with the classes not being defined.</span>
    <span class="ruby-comment"># 1 retry each allowed in case all 3 of</span>
    <span class="ruby-comment"># - YAML</span>
    <span class="ruby-comment"># - YAML::Syck::DefaultKey</span>
    <span class="ruby-comment"># - YAML::PrivateType</span>
    <span class="ruby-comment"># need to be defined</span>
    <span class="ruby-identifier">raise</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">retry_count</span> <span class="ruby-operator">&gt;=</span> <span class="ruby-value">3</span>

    <span class="ruby-comment">#</span>
    <span class="ruby-comment"># Some very old marshaled specs included references to `YAML::PrivateType`</span>
    <span class="ruby-comment"># and `YAML::Syck::DefaultKey` constants due to bugs in the old emitter</span>
    <span class="ruby-comment"># that generated them. Workaround the issue by defining the necessary</span>
    <span class="ruby-comment"># constants and retrying.</span>
    <span class="ruby-comment">#</span>
    <span class="ruby-identifier">message</span> = <span class="ruby-identifier">e</span>.<span class="ruby-identifier">message</span>
    <span class="ruby-identifier">raise</span> <span class="ruby-keyword">unless</span> <span class="ruby-identifier">message</span>.<span class="ruby-identifier">include?</span>(<span class="ruby-string">&quot;YAML::&quot;</span>)

    <span class="ruby-keyword">unless</span> <span class="ruby-constant">Object</span>.<span class="ruby-identifier">const_defined?</span>(<span class="ruby-value">:YAML</span>)
      <span class="ruby-constant">Object</span>.<span class="ruby-identifier">const_set</span> <span class="ruby-string">&quot;YAML&quot;</span>, <span class="ruby-constant">Psych</span>
      <span class="ruby-identifier">yaml_set</span> = <span class="ruby-keyword">true</span>
    <span class="ruby-keyword">end</span>

    <span class="ruby-keyword">if</span> <span class="ruby-identifier">message</span>.<span class="ruby-identifier">include?</span>(<span class="ruby-string">&quot;YAML::Syck::&quot;</span>)
      <span class="ruby-constant">YAML</span>.<span class="ruby-identifier">const_set</span> <span class="ruby-string">&quot;Syck&quot;</span>, <span class="ruby-constant">YAML</span> <span class="ruby-keyword">unless</span> <span class="ruby-constant">YAML</span>.<span class="ruby-identifier">const_defined?</span>(<span class="ruby-value">:Syck</span>)

      <span class="ruby-constant">YAML</span><span class="ruby-operator">::</span><span class="ruby-constant">Syck</span>.<span class="ruby-identifier">const_set</span> <span class="ruby-string">&quot;DefaultKey&quot;</span>, <span class="ruby-constant">Class</span>.<span class="ruby-identifier">new</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">message</span>.<span class="ruby-identifier">include?</span>(<span class="ruby-string">&quot;YAML::Syck::DefaultKey&quot;</span>) <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-operator">!</span><span class="ruby-constant">YAML</span><span class="ruby-operator">::</span><span class="ruby-constant">Syck</span>.<span class="ruby-identifier">const_defined?</span>(<span class="ruby-value">:DefaultKey</span>)
    <span class="ruby-keyword">elsif</span> <span class="ruby-identifier">message</span>.<span class="ruby-identifier">include?</span>(<span class="ruby-string">&quot;YAML::PrivateType&quot;</span>) <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-operator">!</span><span class="ruby-constant">YAML</span>.<span class="ruby-identifier">const_defined?</span>(<span class="ruby-value">:PrivateType</span>)
      <span class="ruby-constant">YAML</span>.<span class="ruby-identifier">const_set</span> <span class="ruby-string">&quot;PrivateType&quot;</span>, <span class="ruby-constant">Class</span>.<span class="ruby-identifier">new</span>
    <span class="ruby-keyword">end</span>

    <span class="ruby-identifier">retry_count</span> <span class="ruby-operator">+=</span> <span class="ruby-value">1</span>
    <span class="ruby-keyword">retry</span>
  <span class="ruby-keyword">ensure</span>
    <span class="ruby-constant">Object</span>.<span class="ruby-identifier">__send__</span>(<span class="ruby-value">:remove_const</span>, <span class="ruby-string">&quot;YAML&quot;</span>) <span class="ruby-keyword">if</span> <span class="ruby-identifier">yaml_set</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-identifier">spec</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Specification</span>.<span class="ruby-identifier">new</span>
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@specification_version</span>, <span class="ruby-identifier">array</span>[<span class="ruby-value">1</span>]

  <span class="ruby-identifier">current_version</span> = <span class="ruby-constant">CURRENT_SPECIFICATION_VERSION</span>

  <span class="ruby-identifier">field_count</span> = <span class="ruby-keyword">if</span> <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">specification_version</span> <span class="ruby-operator">&gt;</span> <span class="ruby-identifier">current_version</span>
    <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@specification_version</span>,
                               <span class="ruby-identifier">current_version</span>
    <span class="ruby-constant">MARSHAL_FIELDS</span>[<span class="ruby-identifier">current_version</span>]
  <span class="ruby-keyword">else</span>
    <span class="ruby-constant">MARSHAL_FIELDS</span>[<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">specification_version</span>]
  <span class="ruby-keyword">end</span>

  <span class="ruby-keyword">if</span> <span class="ruby-identifier">array</span>.<span class="ruby-identifier">size</span> <span class="ruby-operator">&lt;</span> <span class="ruby-identifier">field_count</span>
    <span class="ruby-identifier">raise</span> <span class="ruby-constant">TypeError</span>, <span class="ruby-node">&quot;invalid Gem::Specification format #{array.inspect}&quot;</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@rubygems_version</span>,          <span class="ruby-identifier">array</span>[<span class="ruby-value">0</span>]
  <span class="ruby-comment"># spec version</span>
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@name</span>,                      <span class="ruby-identifier">array</span>[<span class="ruby-value">2</span>]
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@version</span>,                   <span class="ruby-identifier">array</span>[<span class="ruby-value">3</span>]
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">date</span> =                                             <span class="ruby-identifier">array</span>[<span class="ruby-value">4</span>]
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@summary</span>,                   <span class="ruby-identifier">array</span>[<span class="ruby-value">5</span>]
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@required_ruby_version</span>,     <span class="ruby-identifier">array</span>[<span class="ruby-value">6</span>]
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@required_rubygems_version</span>, <span class="ruby-identifier">array</span>[<span class="ruby-value">7</span>]
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">platform</span> =                                         <span class="ruby-identifier">array</span>[<span class="ruby-value">8</span>]
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@dependencies</span>,              <span class="ruby-identifier">array</span>[<span class="ruby-value">9</span>]
  <span class="ruby-comment"># offset due to rubyforge_project removal</span>
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@email</span>,                     <span class="ruby-identifier">array</span>[<span class="ruby-value">11</span>]
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@authors</span>,                   <span class="ruby-identifier">array</span>[<span class="ruby-value">12</span>]
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@description</span>,               <span class="ruby-identifier">array</span>[<span class="ruby-value">13</span>]
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@homepage</span>,                  <span class="ruby-identifier">array</span>[<span class="ruby-value">14</span>]
  <span class="ruby-comment"># offset due to has_rdoc removal</span>
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@licenses</span>,                  <span class="ruby-identifier">array</span>[<span class="ruby-value">17</span>]
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@metadata</span>,                  <span class="ruby-identifier">array</span>[<span class="ruby-value">18</span>]
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@loaded</span>,                    <span class="ruby-keyword">false</span>
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@activated</span>,                 <span class="ruby-keyword">false</span>

  <span class="ruby-identifier">spec</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Load custom marshal format, re-initializing defaults as needed</p>


        </div>





      </div>


      <div id="method-c-add_spec" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-add_spec" title="Link to this method">
                <span class="method-name">add_spec</span>
                <span class="method-args">(spec)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="add_spec-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 845</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">add_spec</span>(<span class="ruby-identifier">spec</span>)
  <span class="ruby-identifier">specification_record</span>.<span class="ruby-identifier">add_spec</span>(<span class="ruby-identifier">spec</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Adds <code>spec</code> to the known specifications, keeping the collection properly sorted.</p>


        </div>





      </div>


      <div id="method-c-all" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-all" title="Link to this method">
                <span class="method-name">all</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="all-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 860</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">all</span>
  <span class="ruby-identifier">warn</span> <span class="ruby-node">&quot;NOTE: Specification.all called from #{caller(1, 1).first}&quot;</span> <span class="ruby-keyword">unless</span>
    <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Deprecate</span>.<span class="ruby-identifier">skip</span>
  <span class="ruby-identifier">_all</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns all specifications. This method is discouraged from use. You probably want to use one of the Enumerable methods instead.</p>


        </div>





      </div>


      <div id="method-c-all-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-all-3D" title="Link to this method">
                <span class="method-name">all=</span>
                <span class="method-args">(specs)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="all-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 869</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">all=</span>(<span class="ruby-identifier">specs</span>)
  <span class="ruby-identifier">specification_record</span>.<span class="ruby-identifier">all</span> = <span class="ruby-identifier">specs</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Sets the known specs to <code>specs</code>.</p>


        </div>





      </div>


      <div id="method-c-all_names" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-all_names" title="Link to this method">
                <span class="method-name">all_names</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="all_names-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 876</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">all_names</span>
  <span class="ruby-identifier">specification_record</span>.<span class="ruby-identifier">all_names</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Return full names of all specs in sorted order.</p>


        </div>





      </div>


      <div id="method-c-array_attributes" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-array_attributes" title="Link to this method">
                <span class="method-name">array_attributes</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="array_attributes-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 885</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">array_attributes</span>
  <span class="ruby-identifier">@@array_attributes</span>.<span class="ruby-identifier">dup</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Return the list of all array-oriented instance variables.</p>


        </div>





      </div>


      <div id="method-c-attribute_names" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-attribute_names" title="Link to this method">
                <span class="method-name">attribute_names</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="attribute_names-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 894</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">attribute_names</span>
  <span class="ruby-identifier">@@attributes</span>.<span class="ruby-identifier">dup</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Return the list of all instance variables.</p>


        </div>





      </div>


      <div id="method-c-default_stubs" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-default_stubs" title="Link to this method">
                <span class="method-name">default_stubs</span>
                <span class="method-args">(pattern = &quot;*.gemspec&quot;)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="default_stubs-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 792</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">default_stubs</span>(<span class="ruby-identifier">pattern</span> = <span class="ruby-string">&quot;*.gemspec&quot;</span>)
  <span class="ruby-identifier">base_dir</span> = <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">default_dir</span>
  <span class="ruby-identifier">gems_dir</span> = <span class="ruby-constant">File</span>.<span class="ruby-identifier">join</span> <span class="ruby-identifier">base_dir</span>, <span class="ruby-string">&quot;gems&quot;</span>
  <span class="ruby-identifier">gemspec_stubs_in</span>(<span class="ruby-constant">Gem</span>.<span class="ruby-identifier">default_specifications_dir</span>, <span class="ruby-identifier">pattern</span>) <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">path</span><span class="ruby-operator">|</span>
    <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">StubSpecification</span>.<span class="ruby-identifier">default_gemspec_stub</span>(<span class="ruby-identifier">path</span>, <span class="ruby-identifier">base_dir</span>, <span class="ruby-identifier">gems_dir</span>)
  <span class="ruby-keyword">end</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns a Gem::StubSpecification for default gems</p>


        </div>





      </div>


      <div id="method-c-dirs" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-dirs" title="Link to this method">
                <span class="method-name">dirs</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="dirs-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 901</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">dirs</span>
  <span class="ruby-identifier">@@dirs</span> <span class="ruby-operator">||=</span> <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">SpecificationRecord</span>.<span class="ruby-identifier">dirs_from</span>(<span class="ruby-identifier">gem_path</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Return the directories that <a href="Specification.html"><code>Specification</code></a> uses to find specs.</p>


        </div>





      </div>


      <div id="method-c-dirs-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-dirs-3D" title="Link to this method">
                <span class="method-name">dirs=</span>
                <span class="method-args">(dirs)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="dirs-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 909</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">dirs=</span>(<span class="ruby-identifier">dirs</span>)
  <span class="ruby-identifier">reset</span>

  <span class="ruby-identifier">@@dirs</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">SpecificationRecord</span>.<span class="ruby-identifier">dirs_from</span>(<span class="ruby-constant">Array</span>(<span class="ruby-identifier">dirs</span>))
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Set the directories that <a href="Specification.html"><code>Specification</code></a> uses to find specs. Setting this resets the list of known specs.</p>


        </div>





      </div>


      <div id="method-c-each" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-each" title="Link to this method">
                <span class="method-name">each</span>
                <span class="method-args">(&amp;block)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="each-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 921</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">each</span>(<span class="ruby-operator">&amp;</span><span class="ruby-identifier">block</span>)
  <span class="ruby-identifier">specification_record</span>.<span class="ruby-identifier">each</span>(<span class="ruby-operator">&amp;</span><span class="ruby-identifier">block</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Enumerate every known spec.  See <a href="Specification.html#method-c-dirs-3D"><code>::dirs=</code></a> and <a href="Specification.html#method-c-add_spec"><code>::add_spec</code></a> to set the list of specs.</p>


        </div>





      </div>


      <div id="method-c-find_active_stub_by_path" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-find_active_stub_by_path" title="Link to this method">
                <span class="method-name">find_active_stub_by_path</span>
                <span class="method-args">(path)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="find_active_stub_by_path-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 974</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">find_active_stub_by_path</span>(<span class="ruby-identifier">path</span>)
  <span class="ruby-identifier">specification_record</span>.<span class="ruby-identifier">find_active_stub_by_path</span>(<span class="ruby-identifier">path</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Return the best specification that contains the file matching <code>path</code>, among those already activated.</p>


        </div>





      </div>


      <div id="method-c-find_all_by_full_name" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-find_all_by_full_name" title="Link to this method">
                <span class="method-name">find_all_by_full_name</span>
                <span class="method-args">(full_name)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="find_all_by_full_name-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 935</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">find_all_by_full_name</span>(<span class="ruby-identifier">full_name</span>)
  <span class="ruby-identifier">stubs</span>.<span class="ruby-identifier">select</span> {<span class="ruby-operator">|</span><span class="ruby-identifier">s</span><span class="ruby-operator">|</span> <span class="ruby-identifier">s</span>.<span class="ruby-identifier">full_name</span> <span class="ruby-operator">==</span> <span class="ruby-identifier">full_name</span> }.<span class="ruby-identifier">map</span>(<span class="ruby-operator">&amp;</span><span class="ruby-value">:to_spec</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns every spec that has the given <code>full_name</code></p>


        </div>





      </div>


      <div id="method-c-find_all_by_name" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-find_all_by_name" title="Link to this method">
                <span class="method-name">find_all_by_name</span>
                <span class="method-args">(name, *requirements)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="find_all_by_name-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 928</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">find_all_by_name</span>(<span class="ruby-identifier">name</span>, <span class="ruby-operator">*</span><span class="ruby-identifier">requirements</span>)
  <span class="ruby-identifier">specification_record</span>.<span class="ruby-identifier">find_all_by_name</span>(<span class="ruby-identifier">name</span>, <span class="ruby-operator">*</span><span class="ruby-identifier">requirements</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns every spec that matches <code>name</code> and optional <code>requirements</code>.</p>


        </div>





      </div>


      <div id="method-c-find_by_full_name" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-find_by_full_name" title="Link to this method">
                <span class="method-name">find_by_full_name</span>
                <span class="method-args">(full_name)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="find_by_full_name-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 951</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">find_by_full_name</span>(<span class="ruby-identifier">full_name</span>)
  <span class="ruby-identifier">stubs</span>.<span class="ruby-identifier">find</span> {<span class="ruby-operator">|</span><span class="ruby-identifier">s</span><span class="ruby-operator">|</span> <span class="ruby-identifier">s</span>.<span class="ruby-identifier">full_name</span> <span class="ruby-operator">==</span> <span class="ruby-identifier">full_name</span> }&amp;.<span class="ruby-identifier">to_spec</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Find the best specification matching a <code>full_name</code>.</p>


        </div>





      </div>


      <div id="method-c-find_by_name" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-find_by_name" title="Link to this method">
                <span class="method-name">find_by_name</span>
                <span class="method-args">(name, *requirements)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="find_by_name-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 943</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">find_by_name</span>(<span class="ruby-identifier">name</span>, <span class="ruby-operator">*</span><span class="ruby-identifier">requirements</span>)
  <span class="ruby-identifier">requirements</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Requirement</span>.<span class="ruby-identifier">default</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">requirements</span>.<span class="ruby-identifier">empty?</span>

  <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Dependency</span>.<span class="ruby-identifier">new</span>(<span class="ruby-identifier">name</span>, <span class="ruby-operator">*</span><span class="ruby-identifier">requirements</span>).<span class="ruby-identifier">to_spec</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Find the best specification matching a <code>name</code> and <code>requirements</code>. Raises if the dependency doesn’t resolve to a valid specification.</p>


        </div>





      </div>


      <div id="method-c-find_by_path" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-find_by_path" title="Link to this method">
                <span class="method-name">find_by_path</span>
                <span class="method-args">(path)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="find_by_path-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 958</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">find_by_path</span>(<span class="ruby-identifier">path</span>)
  <span class="ruby-identifier">specification_record</span>.<span class="ruby-identifier">find_by_path</span>(<span class="ruby-identifier">path</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Return the best specification that contains the file matching <code>path</code>.</p>


        </div>





      </div>


      <div id="method-c-find_in_unresolved" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-find_in_unresolved" title="Link to this method">
                <span class="method-name">find_in_unresolved</span>
                <span class="method-args">(path)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="find_in_unresolved-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 981</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">find_in_unresolved</span>(<span class="ruby-identifier">path</span>)
  <span class="ruby-identifier">unresolved_specs</span>.<span class="ruby-identifier">find_all</span> {<span class="ruby-operator">|</span><span class="ruby-identifier">spec</span><span class="ruby-operator">|</span> <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">contains_requirable_file?</span> <span class="ruby-identifier">path</span> }
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Return currently unresolved specs that contain the file matching <code>path</code>.</p>


        </div>





      </div>


      <div id="method-c-find_in_unresolved_tree" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-find_in_unresolved_tree" title="Link to this method">
                <span class="method-name">find_in_unresolved_tree</span>
                <span class="method-args">(path)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="find_in_unresolved_tree-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 989</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">find_in_unresolved_tree</span>(<span class="ruby-identifier">path</span>)
  <span class="ruby-identifier">unresolved_specs</span>.<span class="ruby-identifier">each</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">spec</span><span class="ruby-operator">|</span>
    <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">traverse</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">_from_spec</span>, <span class="ruby-identifier">_dep</span>, <span class="ruby-identifier">to_spec</span>, <span class="ruby-identifier">trail</span><span class="ruby-operator">|</span>
      <span class="ruby-keyword">if</span> <span class="ruby-identifier">to_spec</span>.<span class="ruby-identifier">has_conflicts?</span> <span class="ruby-operator">||</span> <span class="ruby-identifier">to_spec</span>.<span class="ruby-identifier">conflicts_when_loaded_with?</span>(<span class="ruby-identifier">trail</span>)
        <span class="ruby-value">:next</span>
      <span class="ruby-keyword">else</span>
        <span class="ruby-keyword">return</span> <span class="ruby-identifier">trail</span>.<span class="ruby-identifier">reverse</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">to_spec</span>.<span class="ruby-identifier">contains_requirable_file?</span> <span class="ruby-identifier">path</span>
      <span class="ruby-keyword">end</span>
    <span class="ruby-keyword">end</span>
  <span class="ruby-keyword">end</span>

  []
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Search through all unresolved deps and sub-dependencies and return specs that contain the file matching <code>path</code>.</p>


        </div>





      </div>


      <div id="method-c-find_inactive_by_path" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-find_inactive_by_path" title="Link to this method">
                <span class="method-name">find_inactive_by_path</span>
                <span class="method-args">(path)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="find_inactive_by_path-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 966</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">find_inactive_by_path</span>(<span class="ruby-identifier">path</span>)
  <span class="ruby-identifier">specification_record</span>.<span class="ruby-identifier">find_inactive_by_path</span>(<span class="ruby-identifier">path</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Return the best specification that contains the file matching <code>path</code> amongst the specs that are not activated.</p>


        </div>





      </div>


      <div id="method-c-from_yaml" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-from_yaml" title="Link to this method">
                <span class="method-name">from_yaml</span>
                <span class="method-args">(input)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="from_yaml-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1016</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">from_yaml</span>(<span class="ruby-identifier">input</span>)
  <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">load_yaml</span>

  <span class="ruby-identifier">input</span> = <span class="ruby-identifier">normalize_yaml_input</span> <span class="ruby-identifier">input</span>
  <span class="ruby-identifier">spec</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">SafeYAML</span>.<span class="ruby-identifier">safe_load</span> <span class="ruby-identifier">input</span>

  <span class="ruby-keyword">if</span> <span class="ruby-identifier">spec</span> <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">class</span> <span class="ruby-operator">==</span> <span class="ruby-constant">FalseClass</span>
    <span class="ruby-identifier">raise</span> <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">EndOfYAMLException</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-keyword">unless</span> <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Specification</span> <span class="ruby-operator">===</span> <span class="ruby-identifier">spec</span>
    <span class="ruby-identifier">raise</span> <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Exception</span>, <span class="ruby-string">&quot;YAML data doesn&#39;t evaluate to gem specification&quot;</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">specification_version</span> <span class="ruby-operator">||=</span> <span class="ruby-constant">NONEXISTENT_SPECIFICATION_VERSION</span>
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">reset_nil_attributes_to_default</span>
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">flatten_require_paths</span>

  <span class="ruby-identifier">spec</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Special loader for YAML files.  When a <a href="Specification.html"><code>Specification</code></a> object is loaded from a YAML file, it bypasses the normal Ruby object initialization routine (initialize).  This method makes up for that and deals with gems of different ages.</p>

<p><code>input</code> can be anything that YAML.load() accepts: String or IO.</p>


        </div>





      </div>


      <div id="method-c-latest_spec_for" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-latest_spec_for" title="Link to this method">
                <span class="method-name">latest_spec_for</span>
                <span class="method-args">(name)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="latest_spec_for-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1048</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">latest_spec_for</span>(<span class="ruby-identifier">name</span>)
  <span class="ruby-identifier">specification_record</span>.<span class="ruby-identifier">latest_spec_for</span>(<span class="ruby-identifier">name</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Return the latest installed spec for gem <code>name</code>.</p>


        </div>





      </div>


      <div id="method-c-latest_specs" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-latest_specs" title="Link to this method">
                <span class="method-name">latest_specs</span>
                <span class="method-args">(prerelease = false)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="latest_specs-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1041</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">latest_specs</span>(<span class="ruby-identifier">prerelease</span> = <span class="ruby-keyword">false</span>)
  <span class="ruby-identifier">specification_record</span>.<span class="ruby-identifier">latest_specs</span>(<span class="ruby-identifier">prerelease</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Return the latest specs, optionally including prerelease specs if <code>prerelease</code> is true.</p>


        </div>





      </div>


      <div id="method-c-load" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-load" title="Link to this method">
                <span class="method-name">load</span>
                <span class="method-args">(file)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="load-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1069</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">load</span>(<span class="ruby-identifier">file</span>)
  <span class="ruby-keyword">return</span> <span class="ruby-keyword">unless</span> <span class="ruby-identifier">file</span>

  <span class="ruby-identifier">spec</span> = <span class="ruby-ivar">@load_cache_mutex</span>.<span class="ruby-identifier">synchronize</span> { <span class="ruby-ivar">@load_cache</span>[<span class="ruby-identifier">file</span>] }
  <span class="ruby-keyword">return</span> <span class="ruby-identifier">spec</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">spec</span>

  <span class="ruby-keyword">return</span> <span class="ruby-keyword">unless</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">file?</span>(<span class="ruby-identifier">file</span>)

  <span class="ruby-identifier">code</span> = <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">open_file</span>(<span class="ruby-identifier">file</span>, <span class="ruby-string">&quot;r:UTF-8:-&quot;</span>, <span class="ruby-operator">&amp;</span><span class="ruby-value">:read</span>)

  <span class="ruby-keyword">begin</span>
    <span class="ruby-identifier">spec</span> = <span class="ruby-identifier">eval</span> <span class="ruby-identifier">code</span>, <span class="ruby-identifier">binding</span>, <span class="ruby-identifier">file</span>

    <span class="ruby-keyword">if</span> <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Specification</span> <span class="ruby-operator">===</span> <span class="ruby-identifier">spec</span>
      <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">loaded_from</span> = <span class="ruby-constant">File</span>.<span class="ruby-identifier">expand_path</span> <span class="ruby-identifier">file</span>.<span class="ruby-identifier">to_s</span>
      <span class="ruby-ivar">@load_cache_mutex</span>.<span class="ruby-identifier">synchronize</span> <span class="ruby-keyword">do</span>
        <span class="ruby-identifier">prev</span> = <span class="ruby-ivar">@load_cache</span>[<span class="ruby-identifier">file</span>]
        <span class="ruby-keyword">if</span> <span class="ruby-identifier">prev</span>
          <span class="ruby-identifier">spec</span> = <span class="ruby-identifier">prev</span>
        <span class="ruby-keyword">else</span>
          <span class="ruby-ivar">@load_cache</span>[<span class="ruby-identifier">file</span>] = <span class="ruby-identifier">spec</span>
        <span class="ruby-keyword">end</span>
      <span class="ruby-keyword">end</span>
      <span class="ruby-keyword">return</span> <span class="ruby-identifier">spec</span>
    <span class="ruby-keyword">end</span>

    <span class="ruby-identifier">warn</span> <span class="ruby-node">&quot;[#{file}] isn&#39;t a Gem::Specification (#{spec.class} instead).&quot;</span>
  <span class="ruby-keyword">rescue</span> <span class="ruby-constant">SignalException</span>, <span class="ruby-constant">SystemExit</span>
    <span class="ruby-identifier">raise</span>
  <span class="ruby-keyword">rescue</span> <span class="ruby-constant">SyntaxError</span>, <span class="ruby-constant">StandardError</span> <span class="ruby-operator">=&gt;</span> <span class="ruby-identifier">e</span>
    <span class="ruby-identifier">warn</span> <span class="ruby-node">&quot;Invalid gemspec in [#{file}]: #{e}&quot;</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-keyword">nil</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Loads Ruby format gemspec from <code>file</code>.</p>


        </div>





      </div>


      <div id="method-c-load_defaults" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-load_defaults" title="Link to this method">
                <span class="method-name">load_defaults</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="load_defaults-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 833</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">load_defaults</span>
  <span class="ruby-identifier">each_spec</span>([<span class="ruby-constant">Gem</span>.<span class="ruby-identifier">default_specifications_dir</span>]) <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">spec</span><span class="ruby-operator">|</span>
    <span class="ruby-comment"># #load returns nil if the spec is bad, so we just ignore</span>
    <span class="ruby-comment"># it at this stage</span>
    <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">register_default_spec</span>(<span class="ruby-identifier">spec</span>)
  <span class="ruby-keyword">end</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Loads the default specifications. It should be called only once.</p>


        </div>





      </div>


      <div id="method-c-new" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-new" title="Link to this method">
                <span class="method-name">new</span>
                <span class="method-args">(name = nil, version = nil) { |self| ... }</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="new-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1926</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">initialize</span>(<span class="ruby-identifier">name</span> = <span class="ruby-keyword">nil</span>, <span class="ruby-identifier">version</span> = <span class="ruby-keyword">nil</span>)
  <span class="ruby-keyword">super</span>()
  <span class="ruby-ivar">@gems_dir</span>              = <span class="ruby-keyword">nil</span>
  <span class="ruby-ivar">@base_dir</span>              = <span class="ruby-keyword">nil</span>
  <span class="ruby-ivar">@loaded</span> = <span class="ruby-keyword">false</span>
  <span class="ruby-ivar">@activated</span> = <span class="ruby-keyword">false</span>
  <span class="ruby-ivar">@loaded_from</span> = <span class="ruby-keyword">nil</span>
  <span class="ruby-ivar">@original_platform</span> = <span class="ruby-keyword">nil</span>
  <span class="ruby-ivar">@installed_by_version</span> = <span class="ruby-keyword">nil</span>

  <span class="ruby-identifier">set_nil_attributes_to_nil</span>
  <span class="ruby-identifier">set_not_nil_attributes_to_default_values</span>

  <span class="ruby-ivar">@new_platform</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span><span class="ruby-operator">::</span><span class="ruby-constant">RUBY</span>

  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">name</span> = <span class="ruby-identifier">name</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">name</span>
  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">version</span> = <span class="ruby-identifier">version</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">version</span>

  <span class="ruby-keyword">if</span> (<span class="ruby-identifier">platform</span> = <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">platforms</span>.<span class="ruby-identifier">last</span>) <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-identifier">platform</span> <span class="ruby-operator">!=</span> <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span><span class="ruby-operator">::</span><span class="ruby-constant">RUBY</span> <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-identifier">platform</span> <span class="ruby-operator">!=</span> <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span>.<span class="ruby-identifier">local</span>
    <span class="ruby-keyword">self</span>.<span class="ruby-identifier">platform</span> = <span class="ruby-identifier">platform</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-keyword">yield</span> <span class="ruby-keyword">self</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">block_given?</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p><a href="Specification.html"><code>Specification</code></a> constructor. Assigns the default values to the attributes and yields itself for further initialization.  Optionally takes <code>name</code> and <code>version</code>.</p>


            <div class="method-calls-super">
              Calls superclass method
              
            </div>

        </div>





      </div>


      <div id="method-c-non_nil_attributes" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-non_nil_attributes" title="Link to this method">
                <span class="method-name">non_nil_attributes</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="non_nil_attributes-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1108</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">non_nil_attributes</span>
  <span class="ruby-identifier">@@non_nil_attributes</span>.<span class="ruby-identifier">dup</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p><a href="Specification.html"><code>Specification</code></a> attributes that must be non-nil</p>


        </div>





      </div>


      <div id="method-c-normalize_yaml_input" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-normalize_yaml_input" title="Link to this method">
                <span class="method-name">normalize_yaml_input</span>
                <span class="method-args">(input)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="normalize_yaml_input-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1115</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">normalize_yaml_input</span>(<span class="ruby-identifier">input</span>)
  <span class="ruby-identifier">result</span> = <span class="ruby-identifier">input</span>.<span class="ruby-identifier">respond_to?</span>(<span class="ruby-value">:read</span>) <span class="ruby-operator">?</span> <span class="ruby-identifier">input</span>.<span class="ruby-identifier">read</span> <span class="ruby-operator">:</span> <span class="ruby-identifier">input</span>
  <span class="ruby-identifier">result</span> = <span class="ruby-string">&quot;--- &quot;</span> <span class="ruby-operator">+</span> <span class="ruby-identifier">result</span> <span class="ruby-keyword">unless</span> <span class="ruby-identifier">result</span>.<span class="ruby-identifier">start_with?</span>(<span class="ruby-string">&quot;--- &quot;</span>)
  <span class="ruby-identifier">result</span> = <span class="ruby-identifier">result</span>.<span class="ruby-identifier">dup</span>
  <span class="ruby-identifier">result</span>.<span class="ruby-identifier">gsub!</span>(<span class="ruby-regexp">/ !!null \n/</span>, <span class="ruby-string">&quot; \n&quot;</span>)
  <span class="ruby-comment"># date: 2011-04-26 00:00:00.000000000Z</span>
  <span class="ruby-comment"># date: 2011-04-26 00:00:00.000000000 Z</span>
  <span class="ruby-identifier">result</span>.<span class="ruby-identifier">gsub!</span>(<span class="ruby-regexp">/^(date: \d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d+?)Z/</span>, <span class="ruby-string">&#39;\1 Z&#39;</span>)
  <span class="ruby-identifier">result</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Make sure the YAML specification is properly formatted with dashes</p>


        </div>





      </div>


      <div id="method-c-outdated" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-outdated" title="Link to this method">
                <span class="method-name">outdated</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="outdated-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1133</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">outdated</span>
  <span class="ruby-identifier">outdated_and_latest_version</span>.<span class="ruby-identifier">map</span> {<span class="ruby-operator">|</span><span class="ruby-identifier">local</span>, <span class="ruby-identifier">_</span><span class="ruby-operator">|</span> <span class="ruby-identifier">local</span>.<span class="ruby-identifier">name</span> }
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Return a list of all outdated local gem names.  This method is HEAVY as it must go fetch specifications from the server.</p>

<p>Use <a href="Specification.html#method-c-outdated_and_latest_version"><code>outdated_and_latest_version</code></a> if you wish to retrieve the latest remote version as well.</p>


        </div>





      </div>


      <div id="method-c-outdated_and_latest_version" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-outdated_and_latest_version" title="Link to this method">
                <span class="method-name">outdated_and_latest_version</span>
                <span class="method-args">() { |local_spec, latest_remote| ... }</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="outdated_and_latest_version-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1144</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">outdated_and_latest_version</span>
  <span class="ruby-keyword">return</span> <span class="ruby-identifier">enum_for</span> <span class="ruby-identifier">__method__</span> <span class="ruby-keyword">unless</span> <span class="ruby-identifier">block_given?</span>

  <span class="ruby-comment"># TODO: maybe we should switch to rubygems&#39; version service?</span>
  <span class="ruby-identifier">fetcher</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">SpecFetcher</span>.<span class="ruby-identifier">fetcher</span>

  <span class="ruby-identifier">latest_specs</span>(<span class="ruby-keyword">true</span>).<span class="ruby-identifier">each</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">local_spec</span><span class="ruby-operator">|</span>
    <span class="ruby-identifier">dependency</span> =
      <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Dependency</span>.<span class="ruby-identifier">new</span> <span class="ruby-identifier">local_spec</span>.<span class="ruby-identifier">name</span>, <span class="ruby-node">&quot;&gt;= #{local_spec.version}&quot;</span>

    <span class="ruby-identifier">remotes</span>, = <span class="ruby-identifier">fetcher</span>.<span class="ruby-identifier">search_for_dependency</span> <span class="ruby-identifier">dependency</span>
    <span class="ruby-identifier">remotes</span>  = <span class="ruby-identifier">remotes</span>.<span class="ruby-identifier">map</span> {<span class="ruby-operator">|</span><span class="ruby-identifier">n</span>, <span class="ruby-identifier">_</span><span class="ruby-operator">|</span> <span class="ruby-identifier">n</span>.<span class="ruby-identifier">version</span> }

    <span class="ruby-identifier">latest_remote</span> = <span class="ruby-identifier">remotes</span>.<span class="ruby-identifier">sort</span>.<span class="ruby-identifier">last</span>

    <span class="ruby-keyword">yield</span> [<span class="ruby-identifier">local_spec</span>, <span class="ruby-identifier">latest_remote</span>] <span class="ruby-keyword">if</span>
      <span class="ruby-identifier">latest_remote</span> <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-identifier">local_spec</span>.<span class="ruby-identifier">version</span> <span class="ruby-operator">&lt;</span> <span class="ruby-identifier">latest_remote</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-keyword">nil</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Enumerates the outdated local gems yielding the local specification and the latest remote version.</p>

<p>This method may take some time to return as it must check each local gem against the server’s index.</p>


        </div>





      </div>


      <div id="method-c-remove_spec" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-remove_spec" title="Link to this method">
                <span class="method-name">remove_spec</span>
                <span class="method-args">(spec)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="remove_spec-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 852</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">remove_spec</span>(<span class="ruby-identifier">spec</span>)
  <span class="ruby-identifier">specification_record</span>.<span class="ruby-identifier">remove_spec</span>(<span class="ruby-identifier">spec</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Removes <code>spec</code> from the known specs.</p>


        </div>





      </div>


      <div id="method-c-required_attribute-3F" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-required_attribute-3F" title="Link to this method">
                <span class="method-name">required_attribute?</span>
                <span class="method-args">(name)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="required_attribute-3F-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1169</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">required_attribute?</span>(<span class="ruby-identifier">name</span>)
  <span class="ruby-identifier">@@required_attributes</span>.<span class="ruby-identifier">include?</span> <span class="ruby-identifier">name</span>.<span class="ruby-identifier">to_sym</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Is <code>name</code> a required attribute?</p>


        </div>





      </div>


      <div id="method-c-required_attributes" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-required_attributes" title="Link to this method">
                <span class="method-name">required_attributes</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="required_attributes-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1176</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">required_attributes</span>
  <span class="ruby-identifier">@@required_attributes</span>.<span class="ruby-identifier">dup</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Required specification attributes</p>


        </div>





      </div>


      <div id="method-c-reset" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-reset" title="Link to this method">
                <span class="method-name">reset</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="reset-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1184</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">reset</span>
  <span class="ruby-identifier">@@dirs</span> = <span class="ruby-keyword">nil</span>
  <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">pre_reset_hooks</span>.<span class="ruby-identifier">each</span>(<span class="ruby-operator">&amp;</span><span class="ruby-value">:call</span>)
  <span class="ruby-ivar">@specification_record</span> = <span class="ruby-keyword">nil</span>
  <span class="ruby-identifier">clear_load_cache</span>

  <span class="ruby-keyword">unless</span> <span class="ruby-identifier">unresolved_deps</span>.<span class="ruby-identifier">empty?</span>
    <span class="ruby-identifier">unresolved</span> = <span class="ruby-identifier">unresolved_deps</span>.<span class="ruby-identifier">filter_map</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">name</span>, <span class="ruby-identifier">dep</span><span class="ruby-operator">|</span>
      <span class="ruby-identifier">matching_versions</span> = <span class="ruby-identifier">find_all_by_name</span>(<span class="ruby-identifier">name</span>)
      <span class="ruby-keyword">next</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">dep</span>.<span class="ruby-identifier">latest_version?</span> <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-identifier">matching_versions</span>.<span class="ruby-identifier">any?</span>(<span class="ruby-operator">&amp;</span><span class="ruby-value">:default_gem?</span>)

      [<span class="ruby-identifier">dep</span>, <span class="ruby-identifier">matching_versions</span>.<span class="ruby-identifier">uniq</span>(<span class="ruby-operator">&amp;</span><span class="ruby-value">:full_name</span>)]
    <span class="ruby-keyword">end</span>.<span class="ruby-identifier">to_h</span>

    <span class="ruby-keyword">unless</span> <span class="ruby-identifier">unresolved</span>.<span class="ruby-identifier">empty?</span>
      <span class="ruby-identifier">warn</span> <span class="ruby-string">&quot;WARN: Unresolved or ambiguous specs during Gem::Specification.reset:&quot;</span>
      <span class="ruby-identifier">unresolved</span>.<span class="ruby-identifier">each</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">dep</span>, <span class="ruby-identifier">versions</span><span class="ruby-operator">|</span>
        <span class="ruby-identifier">warn</span> <span class="ruby-node">&quot;      #{dep}&quot;</span>

        <span class="ruby-keyword">unless</span> <span class="ruby-identifier">versions</span>.<span class="ruby-identifier">empty?</span>
          <span class="ruby-identifier">warn</span> <span class="ruby-string">&quot;      Available/installed versions of this gem:&quot;</span>
          <span class="ruby-identifier">versions</span>.<span class="ruby-identifier">each</span> {<span class="ruby-operator">|</span><span class="ruby-identifier">s</span><span class="ruby-operator">|</span> <span class="ruby-identifier">warn</span> <span class="ruby-node">&quot;      - #{s.version}&quot;</span> }
        <span class="ruby-keyword">end</span>
      <span class="ruby-keyword">end</span>
      <span class="ruby-identifier">warn</span> <span class="ruby-string">&quot;WARN: Clearing out unresolved specs. Try &#39;gem cleanup &lt;gem&gt;&#39;&quot;</span>
      <span class="ruby-identifier">warn</span> <span class="ruby-string">&quot;Please report a bug if this causes problems.&quot;</span>
    <span class="ruby-keyword">end</span>

    <span class="ruby-identifier">unresolved_deps</span>.<span class="ruby-identifier">clear</span>
  <span class="ruby-keyword">end</span>
  <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">post_reset_hooks</span>.<span class="ruby-identifier">each</span>(<span class="ruby-operator">&amp;</span><span class="ruby-value">:call</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Reset the list of known specs, running pre and post reset hooks registered in <a href="../Gem.html"><code>Gem</code></a>.</p>


        </div>





      </div>


      <div id="method-c-specification_record" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-specification_record" title="Link to this method">
                <span class="method-name">specification_record</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="specification_record-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1220</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">specification_record</span>
  <span class="ruby-ivar">@specification_record</span> <span class="ruby-operator">||=</span> <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">SpecificationRecord</span>.<span class="ruby-identifier">new</span>(<span class="ruby-identifier">dirs</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Keeps track of all currently known specifications</p>


        </div>





      </div>


      <div id="method-c-stubs" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-stubs" title="Link to this method">
                <span class="method-name">stubs</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="stubs-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 785</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">stubs</span>
  <span class="ruby-identifier">specification_record</span>.<span class="ruby-identifier">stubs</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns a Gem::StubSpecification for every installed gem</p>


        </div>





      </div>


      <div id="method-c-stubs_for" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-stubs_for" title="Link to this method">
                <span class="method-name">stubs_for</span>
                <span class="method-args">(name)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="stubs_for-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 804</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">stubs_for</span>(<span class="ruby-identifier">name</span>)
  <span class="ruby-identifier">specification_record</span>.<span class="ruby-identifier">stubs_for</span>(<span class="ruby-identifier">name</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns a Gem::StubSpecification for installed gem named <code>name</code> only returns stubs that match Gem.platforms</p>


        </div>





      </div>


      <div id="method-c-unresolved_deps" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-c-unresolved_deps" title="Link to this method">
                <span class="method-name">unresolved_deps</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="unresolved_deps-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1225</span>
<span class="ruby-keyword">def</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier ruby-title">unresolved_deps</span>
  <span class="ruby-ivar">@unresolved_deps</span> <span class="ruby-operator">||=</span> <span class="ruby-constant">Hash</span>.<span class="ruby-identifier">new</span> {<span class="ruby-operator">|</span><span class="ruby-identifier">h</span>, <span class="ruby-identifier">n</span><span class="ruby-operator">|</span> <span class="ruby-identifier">h</span>[<span class="ruby-identifier">n</span>] = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Dependency</span>.<span class="ruby-identifier">new</span> <span class="ruby-identifier">n</span> }
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>DOC: This method needs documented or nodoc’d</p>


        </div>





      </div>


    </section>







     <section id="public-instance-specification-internals-method-details" class="method-section anchor-link">
       <header>
         <h3 id="public-instance-methods"><a href="#public-instance-methods">Public Instance Methods</a></h3>
       </header>


      <div id="method-i-_dump" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-_dump" title="Link to this method">
                <span class="method-name">_dump</span>
                <span class="method-args">(limit)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="_dump-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1337</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">_dump</span>(<span class="ruby-identifier">limit</span>)
  <span class="ruby-constant">Marshal</span>.<span class="ruby-identifier">dump</span> [
    <span class="ruby-ivar">@rubygems_version</span>,
    <span class="ruby-ivar">@specification_version</span>,
    <span class="ruby-ivar">@name</span>,
    <span class="ruby-ivar">@version</span>,
    <span class="ruby-identifier">date</span>,
    <span class="ruby-ivar">@summary</span>,
    <span class="ruby-ivar">@required_ruby_version</span>,
    <span class="ruby-ivar">@required_rubygems_version</span>,
    <span class="ruby-ivar">@original_platform</span>,
    <span class="ruby-ivar">@dependencies</span>,
    <span class="ruby-string">&quot;&quot;</span>, <span class="ruby-comment"># rubyforge_project</span>
    <span class="ruby-ivar">@email</span>,
    <span class="ruby-ivar">@authors</span>,
    <span class="ruby-ivar">@description</span>,
    <span class="ruby-ivar">@homepage</span>,
    <span class="ruby-keyword">true</span>, <span class="ruby-comment"># has_rdoc</span>
    <span class="ruby-ivar">@new_platform</span>,
    <span class="ruby-ivar">@licenses</span>,
    <span class="ruby-ivar">@metadata</span>,
  ]
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Dump only crucial instance variables.</p>


        </div>





      </div>


      <div id="method-i-abbreviate" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-abbreviate" title="Link to this method">
                <span class="method-name">abbreviate</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="abbreviate-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1426</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">abbreviate</span>
  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">files</span> = []
  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">test_files</span> = []
  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">rdoc_options</span> = []
  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">extra_rdoc_files</span> = []
  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">cert_chain</span> = []
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Abbreviate the spec for downloading.  Abbreviated specs are only used for searching, downloading and related activities and do not need deployment specific information (e.g. list of files).  So we abbreviate the spec, making it much smaller for quicker downloads.</p>


        </div>





      </div>


      <div id="method-i-activate" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-activate" title="Link to this method">
                <span class="method-name">activate</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="activate-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1367</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">activate</span>
  <span class="ruby-identifier">other</span> = <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">loaded_specs</span>[<span class="ruby-identifier">name</span>]
  <span class="ruby-keyword">if</span> <span class="ruby-identifier">other</span>
    <span class="ruby-identifier">check_version_conflict</span> <span class="ruby-identifier">other</span>
    <span class="ruby-keyword">return</span> <span class="ruby-keyword">false</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-identifier">raise_if_conflicts</span>

  <span class="ruby-identifier">activate_dependencies</span>
  <span class="ruby-identifier">add_self_to_load_path</span>

  <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">loaded_specs</span>[<span class="ruby-identifier">name</span>] = <span class="ruby-keyword">self</span>
  <span class="ruby-ivar">@activated</span> = <span class="ruby-keyword">true</span>
  <span class="ruby-ivar">@loaded</span> = <span class="ruby-keyword">true</span>

  <span class="ruby-keyword">true</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Activate this spec, registering it as a loaded spec and adding it’s lib paths to $LOAD_PATH. Returns true if the spec was activated, false if it was previously activated. Freaks out if there are conflicts upon activation.</p>


        </div>





      </div>


      <div id="method-i-activate_dependencies" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-activate_dependencies" title="Link to this method">
                <span class="method-name">activate_dependencies</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="activate_dependencies-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1391</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">activate_dependencies</span>
  <span class="ruby-identifier">unresolved</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Specification</span>.<span class="ruby-identifier">unresolved_deps</span>

  <span class="ruby-identifier">runtime_dependencies</span>.<span class="ruby-identifier">each</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">spec_dep</span><span class="ruby-operator">|</span>
    <span class="ruby-keyword">if</span> <span class="ruby-identifier">loaded</span> = <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">loaded_specs</span>[<span class="ruby-identifier">spec_dep</span>.<span class="ruby-identifier">name</span>]
      <span class="ruby-keyword">next</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">spec_dep</span>.<span class="ruby-identifier">matches_spec?</span> <span class="ruby-identifier">loaded</span>

      <span class="ruby-identifier">msg</span> = <span class="ruby-node">&quot;can&#39;t satisfy &#39;#{spec_dep}&#39;, already activated &#39;#{loaded.full_name}&#39;&quot;</span>
      <span class="ruby-identifier">e</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">LoadError</span>.<span class="ruby-identifier">new</span> <span class="ruby-identifier">msg</span>
      <span class="ruby-identifier">e</span>.<span class="ruby-identifier">name</span> = <span class="ruby-identifier">spec_dep</span>.<span class="ruby-identifier">name</span>

      <span class="ruby-identifier">raise</span> <span class="ruby-identifier">e</span>
    <span class="ruby-keyword">end</span>

    <span class="ruby-identifier">specs</span> = <span class="ruby-identifier">spec_dep</span>.<span class="ruby-identifier">matching_specs</span>(<span class="ruby-keyword">true</span>).<span class="ruby-identifier">uniq</span>(<span class="ruby-operator">&amp;</span><span class="ruby-value">:full_name</span>)

    <span class="ruby-keyword">if</span> <span class="ruby-identifier">specs</span>.<span class="ruby-identifier">size</span> <span class="ruby-operator">==</span> <span class="ruby-value">0</span>
      <span class="ruby-identifier">raise</span> <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">MissingSpecError</span>.<span class="ruby-identifier">new</span>(<span class="ruby-identifier">spec_dep</span>.<span class="ruby-identifier">name</span>, <span class="ruby-identifier">spec_dep</span>.<span class="ruby-identifier">requirement</span>, <span class="ruby-node">&quot;at: #{spec_file}&quot;</span>)
    <span class="ruby-keyword">elsif</span> <span class="ruby-identifier">specs</span>.<span class="ruby-identifier">size</span> <span class="ruby-operator">==</span> <span class="ruby-value">1</span>
      <span class="ruby-identifier">specs</span>.<span class="ruby-identifier">first</span>.<span class="ruby-identifier">activate</span>
    <span class="ruby-keyword">else</span>
      <span class="ruby-identifier">name</span> = <span class="ruby-identifier">spec_dep</span>.<span class="ruby-identifier">name</span>
      <span class="ruby-identifier">unresolved</span>[<span class="ruby-identifier">name</span>] = <span class="ruby-identifier">unresolved</span>[<span class="ruby-identifier">name</span>].<span class="ruby-identifier">merge</span> <span class="ruby-identifier">spec_dep</span>
    <span class="ruby-keyword">end</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-identifier">unresolved</span>.<span class="ruby-identifier">delete</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier">name</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Activate all unambiguously resolved runtime dependencies of this spec. Add any ambiguous dependencies to the unresolved list to be resolved later, as needed.</p>


        </div>





      </div>


      <div id="method-i-add_bindir" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-add_bindir" title="Link to this method">
                <span class="method-name">add_bindir</span>
                <span class="method-args">(executables)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="add_bindir-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1462</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">add_bindir</span>(<span class="ruby-identifier">executables</span>)
  <span class="ruby-keyword">return</span> <span class="ruby-keyword">nil</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">executables</span>.<span class="ruby-identifier">nil?</span>

  <span class="ruby-keyword">if</span> <span class="ruby-ivar">@bindir</span>
    <span class="ruby-constant">Array</span>(<span class="ruby-identifier">executables</span>).<span class="ruby-identifier">map</span> {<span class="ruby-operator">|</span><span class="ruby-identifier">e</span><span class="ruby-operator">|</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">join</span>(<span class="ruby-ivar">@bindir</span>, <span class="ruby-identifier">e</span>) }
  <span class="ruby-keyword">else</span>
    <span class="ruby-identifier">executables</span>
  <span class="ruby-keyword">end</span>
<span class="ruby-keyword">rescue</span> <span class="ruby-constant">StandardError</span>
  <span class="ruby-keyword">nil</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns an array with bindir attached to each executable in the <code>executables</code> list</p>


        </div>





      </div>


      <div id="method-i-add_runtime_dependency" class="method-detail anchor-link method-alias">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-add_runtime_dependency" title="Link to this method">
                <span class="method-name">add_runtime_dependency</span>
                <span class="method-args">(gem, *requirements)</span>
              </a>
            </div>

        </div>




        <div class="method-description">


          


        </div>





        <div class="aliases">
          Alias for: <a href="Specification.html#method-i-add_dependency">add_dependency</a>
        </div>

      </div>


      <div id="method-i-add_self_to_load_path" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-add_self_to_load_path" title="Link to this method">
                <span class="method-name">add_self_to_load_path</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="add_self_to_load_path-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1501</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">add_self_to_load_path</span>
  <span class="ruby-keyword">return</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">default_gem?</span>

  <span class="ruby-identifier">paths</span> = <span class="ruby-identifier">full_require_paths</span>

  <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">add_to_load_path</span>(<span class="ruby-operator">*</span><span class="ruby-identifier">paths</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Adds this spec’s require paths to LOAD_PATH, in the proper location.</p>


        </div>





      </div>


      <div id="method-i-author" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-author" title="Link to this method">
                <span class="method-name">author</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="author-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1512</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">author</span>
  (<span class="ruby-identifier">val</span> = <span class="ruby-identifier">authors</span>) <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-identifier">val</span>.<span class="ruby-identifier">first</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Singular reader for <a href="Specification.html#method-i-authors"><code>authors</code></a>.  Returns the first author in the list</p>


        </div>





      </div>


      <div id="method-i-authors" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-authors" title="Link to this method">
                <span class="method-name">authors</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="authors-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1521</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">authors</span>
  <span class="ruby-ivar">@authors</span> <span class="ruby-operator">||=</span> []
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>The list of author names who wrote this gem.</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">authors</span> = [<span class="ruby-string">&#39;Chad Fowler&#39;</span>, <span class="ruby-string">&#39;Jim Weirich&#39;</span>, <span class="ruby-string">&#39;Rich Kilmer&#39;</span>]
</pre>


        </div>





      </div>


      <div id="method-i-base_dir" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-base_dir" title="Link to this method">
                <span class="method-name">base_dir</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="base_dir-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1980</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">base_dir</span>
  <span class="ruby-keyword">return</span> <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">dir</span> <span class="ruby-keyword">unless</span> <span class="ruby-identifier">loaded_from</span>
  <span class="ruby-ivar">@base_dir</span> <span class="ruby-operator">||=</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">default_gem?</span>
    <span class="ruby-constant">File</span>.<span class="ruby-identifier">dirname</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">dirname</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">dirname</span> <span class="ruby-identifier">loaded_from</span>
  <span class="ruby-keyword">else</span>
    <span class="ruby-constant">File</span>.<span class="ruby-identifier">dirname</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">dirname</span> <span class="ruby-identifier">loaded_from</span>
  <span class="ruby-keyword">end</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          


        </div>





      </div>


      <div id="method-i-bin_dir" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-bin_dir" title="Link to this method">
                <span class="method-name">bin_dir</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="bin_dir-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1531</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">bin_dir</span>
  <span class="ruby-ivar">@bin_dir</span> <span class="ruby-operator">||=</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">join</span> <span class="ruby-identifier">gem_dir</span>, <span class="ruby-identifier">bindir</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns the full path to installed gem’s bin directory.</p>

<p>NOTE: do not confuse this with <code>bindir</code>, which is just ‘bin’, not a full path.</p>


        </div>





      </div>


      <div id="method-i-bin_file" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-bin_file" title="Link to this method">
                <span class="method-name">bin_file</span>
                <span class="method-args">(name)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="bin_file-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1538</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">bin_file</span>(<span class="ruby-identifier">name</span>)
  <span class="ruby-constant">File</span>.<span class="ruby-identifier">join</span> <span class="ruby-identifier">bin_dir</span>, <span class="ruby-identifier">name</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns the full path to an executable named <code>name</code> in this gem.</p>


        </div>





      </div>


      <div id="method-i-build_args" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-build_args" title="Link to this method">
                <span class="method-name">build_args</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="build_args-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1545</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">build_args</span>
  <span class="ruby-keyword">if</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">exist?</span> <span class="ruby-identifier">build_info_file</span>
    <span class="ruby-identifier">build_info</span> = <span class="ruby-constant">File</span>.<span class="ruby-identifier">readlines</span> <span class="ruby-identifier">build_info_file</span>
    <span class="ruby-identifier">build_info</span> = <span class="ruby-identifier">build_info</span>.<span class="ruby-identifier">map</span>(<span class="ruby-operator">&amp;</span><span class="ruby-value">:strip</span>)
    <span class="ruby-identifier">build_info</span>.<span class="ruby-identifier">delete</span> <span class="ruby-string">&quot;&quot;</span>
    <span class="ruby-identifier">build_info</span>
  <span class="ruby-keyword">else</span>
    []
  <span class="ruby-keyword">end</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns the <a href="Specification.html#method-i-build_args"><code>build_args</code></a> used to install the gem</p>


        </div>





      </div>


      <div id="method-i-build_info_dir" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-build_info_dir" title="Link to this method">
                <span class="method-name">build_info_dir</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="build_info_dir-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1593</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">build_info_dir</span>
  <span class="ruby-constant">File</span>.<span class="ruby-identifier">join</span> <span class="ruby-identifier">base_dir</span>, <span class="ruby-string">&quot;build_info&quot;</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns the full path to the build info directory</p>


        </div>





      </div>


      <div id="method-i-build_info_file" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-build_info_file" title="Link to this method">
                <span class="method-name">build_info_file</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="build_info_file-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1601</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">build_info_file</span>
  <span class="ruby-constant">File</span>.<span class="ruby-identifier">join</span> <span class="ruby-identifier">build_info_dir</span>, <span class="ruby-node">&quot;#{full_name}.info&quot;</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns the full path to the file containing the build information generated when the gem was installed</p>


        </div>





      </div>


      <div id="method-i-cache_dir" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-cache_dir" title="Link to this method">
                <span class="method-name">cache_dir</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="cache_dir-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1609</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">cache_dir</span>
  <span class="ruby-constant">File</span>.<span class="ruby-identifier">join</span> <span class="ruby-identifier">base_dir</span>, <span class="ruby-string">&quot;cache&quot;</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns the full path to the cache directory containing this spec’s cached gem.</p>


        </div>





      </div>


      <div id="method-i-cache_file" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-cache_file" title="Link to this method">
                <span class="method-name">cache_file</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="cache_file-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1616</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">cache_file</span>
  <span class="ruby-constant">File</span>.<span class="ruby-identifier">join</span> <span class="ruby-identifier">cache_dir</span>, <span class="ruby-node">&quot;#{full_name}.gem&quot;</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns the full path to the cached gem for this spec.</p>


        </div>





      </div>


      <div id="method-i-conflicts" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-conflicts" title="Link to this method">
                <span class="method-name">conflicts</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="conflicts-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1623</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">conflicts</span>
  <span class="ruby-identifier">conflicts</span> = {}
  <span class="ruby-identifier">runtime_dependencies</span>.<span class="ruby-identifier">each</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">dep</span><span class="ruby-operator">|</span>
    <span class="ruby-identifier">spec</span> = <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">loaded_specs</span>[<span class="ruby-identifier">dep</span>.<span class="ruby-identifier">name</span>]
    <span class="ruby-keyword">if</span> <span class="ruby-identifier">spec</span> <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-operator">!</span><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">satisfies_requirement?</span>(<span class="ruby-identifier">dep</span>)
      (<span class="ruby-identifier">conflicts</span>[<span class="ruby-identifier">spec</span>] <span class="ruby-operator">||=</span> []) <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-identifier">dep</span>
    <span class="ruby-keyword">end</span>
  <span class="ruby-keyword">end</span>
  <span class="ruby-identifier">env_req</span> = <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">env_requirement</span>(<span class="ruby-identifier">name</span>)
  (<span class="ruby-identifier">conflicts</span>[<span class="ruby-keyword">self</span>] <span class="ruby-operator">||=</span> []) <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-identifier">env_req</span> <span class="ruby-keyword">unless</span> <span class="ruby-identifier">env_req</span>.<span class="ruby-identifier">satisfied_by?</span> <span class="ruby-identifier">version</span>
  <span class="ruby-identifier">conflicts</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Return any possible conflicts against the currently loaded specs.</p>


        </div>





      </div>


      <div id="method-i-date" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-date" title="Link to this method">
                <span class="method-name">date</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="date-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1667</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">date</span>
  <span class="ruby-ivar">@date</span> <span class="ruby-operator">||=</span> <span class="ruby-constant">Time</span>.<span class="ruby-identifier">utc</span>(<span class="ruby-operator">*</span><span class="ruby-constant">Gem</span>.<span class="ruby-identifier">source_date_epoch</span>.<span class="ruby-identifier">utc</span>.<span class="ruby-identifier">to_a</span>[<span class="ruby-value">3</span><span class="ruby-operator">..</span><span class="ruby-value">5</span>].<span class="ruby-identifier">reverse</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>The date this gem was created.</p>

<p>If SOURCE_DATE_EPOCH is set as an environment variable, use that to support reproducible builds; otherwise, default to the current UTC date.</p>

<p>Details on SOURCE_DATE_EPOCH: <a href="https://reproducible-builds.org/specs/source-date-epoch">reproducible-builds.org/specs/source-date-epoch</a>/</p>


        </div>





      </div>


      <div id="method-i-date-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-date-3D" title="Link to this method">
                <span class="method-name">date=</span>
                <span class="method-args">(date)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="date-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1687</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">date=</span>(<span class="ruby-identifier">date</span>)
  <span class="ruby-comment"># We want to end up with a Time object with one-day resolution.</span>
  <span class="ruby-comment"># This is the cleanest, most-readable, faster-than-using-Date</span>
  <span class="ruby-comment"># way to do it.</span>
  <span class="ruby-ivar">@date</span> = <span class="ruby-keyword">case</span> <span class="ruby-identifier">date</span>
          <span class="ruby-keyword">when</span> <span class="ruby-constant">String</span> <span class="ruby-keyword">then</span>
            <span class="ruby-keyword">if</span> <span class="ruby-constant">DateTimeFormat</span> <span class="ruby-operator">=~</span> <span class="ruby-identifier">date</span>
              <span class="ruby-constant">Time</span>.<span class="ruby-identifier">utc</span>(<span class="ruby-node">$1</span>.<span class="ruby-identifier">to_i</span>, <span class="ruby-node">$2</span>.<span class="ruby-identifier">to_i</span>, <span class="ruby-node">$3</span>.<span class="ruby-identifier">to_i</span>)
            <span class="ruby-keyword">else</span>
              <span class="ruby-identifier">raise</span>(<span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">InvalidSpecificationException</span>,
                    <span class="ruby-node">&quot;invalid date format in specification: #{date.inspect}&quot;</span>)
            <span class="ruby-keyword">end</span>
          <span class="ruby-keyword">when</span> <span class="ruby-constant">Time</span>, <span class="ruby-constant">DateLike</span> <span class="ruby-keyword">then</span>
            <span class="ruby-constant">Time</span>.<span class="ruby-identifier">utc</span>(<span class="ruby-identifier">date</span>.<span class="ruby-identifier">year</span>, <span class="ruby-identifier">date</span>.<span class="ruby-identifier">month</span>, <span class="ruby-identifier">date</span>.<span class="ruby-identifier">day</span>)
          <span class="ruby-keyword">else</span>
            <span class="ruby-constant">TODAY</span>
  <span class="ruby-keyword">end</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>The date this gem was created</p>

<p>DO NOT set this, it is set automatically when the gem is packaged.</p>


        </div>





      </div>


      <div id="method-i-default_value" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-default_value" title="Link to this method">
                <span class="method-name">default_value</span>
                <span class="method-args">(name)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="default_value-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1709</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">default_value</span>(<span class="ruby-identifier">name</span>)
  <span class="ruby-identifier">@@default_value</span>[<span class="ruby-identifier">name</span>]
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>The default value for specification attribute <code>name</code></p>


        </div>





      </div>


      <div id="method-i-dependencies" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-dependencies" title="Link to this method">
                <span class="method-name">dependencies</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="dependencies-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1719</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">dependencies</span>
  <span class="ruby-ivar">@dependencies</span> <span class="ruby-operator">||=</span> []
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>A list of Gem::Dependency objects this gem depends on.</p>

<p>Use <a href="Specification.html#method-i-add_dependency"><code>add_dependency</code></a> or <a href="Specification.html#method-i-add_development_dependency"><code>add_development_dependency</code></a> to add dependencies to a gem.</p>


        </div>





      </div>


      <div id="method-i-dependent_gems" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-dependent_gems" title="Link to this method">
                <span class="method-name">dependent_gems</span>
                <span class="method-args">(check_dev = true)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="dependent_gems-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1729</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">dependent_gems</span>(<span class="ruby-identifier">check_dev</span> = <span class="ruby-keyword">true</span>)
  <span class="ruby-identifier">out</span> = []
  <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Specification</span>.<span class="ruby-identifier">each</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">spec</span><span class="ruby-operator">|</span>
    <span class="ruby-identifier">deps</span> = <span class="ruby-identifier">check_dev</span> <span class="ruby-operator">?</span> <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">dependencies</span> <span class="ruby-operator">:</span> <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">runtime_dependencies</span>
    <span class="ruby-identifier">deps</span>.<span class="ruby-identifier">each</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">dep</span><span class="ruby-operator">|</span>
      <span class="ruby-keyword">next</span> <span class="ruby-keyword">unless</span> <span class="ruby-identifier">satisfies_requirement?</span>(<span class="ruby-identifier">dep</span>)
      <span class="ruby-identifier">sats</span> = []
      <span class="ruby-identifier">find_all_satisfiers</span>(<span class="ruby-identifier">dep</span>) <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">sat</span><span class="ruby-operator">|</span>
        <span class="ruby-identifier">sats</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-identifier">sat</span>
      <span class="ruby-keyword">end</span>
      <span class="ruby-identifier">out</span> <span class="ruby-operator">&lt;&lt;</span> [<span class="ruby-identifier">spec</span>, <span class="ruby-identifier">dep</span>, <span class="ruby-identifier">sats</span>]
    <span class="ruby-keyword">end</span>
  <span class="ruby-keyword">end</span>
  <span class="ruby-identifier">out</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Return a list of all gems that have a dependency on this gemspec.  The list is structured with entries that conform to:</p>

<pre class="ruby">[<span class="ruby-identifier">depending_gem</span>, <span class="ruby-identifier">dependency</span>, [<span class="ruby-identifier">list_of_gems_that_satisfy_dependency</span>]]
</pre>


        </div>





      </div>


      <div id="method-i-dependent_specs" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-dependent_specs" title="Link to this method">
                <span class="method-name">dependent_specs</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="dependent_specs-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1748</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">dependent_specs</span>
  <span class="ruby-identifier">runtime_dependencies</span>.<span class="ruby-identifier">flat_map</span>(<span class="ruby-operator">&amp;</span><span class="ruby-value">:to_specs</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns all specs that matches this spec’s runtime dependencies.</p>


        </div>





      </div>


      <div id="method-i-description-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-description-3D" title="Link to this method">
                <span class="method-name">description=</span>
                <span class="method-args">(str)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="description-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1755</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">description=</span>(<span class="ruby-identifier">str</span>)
  <span class="ruby-ivar">@description</span> = <span class="ruby-identifier">str</span>.<span class="ruby-identifier">to_s</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>A detailed description of this gem.  See also <a href="Specification.html#attribute-i-summary"><code>summary</code></a></p>


        </div>





      </div>


      <div id="method-i-development_dependencies" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-development_dependencies" title="Link to this method">
                <span class="method-name">development_dependencies</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="development_dependencies-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1762</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">development_dependencies</span>
  <span class="ruby-identifier">dependencies</span>.<span class="ruby-identifier">select</span> {<span class="ruby-operator">|</span><span class="ruby-identifier">d</span><span class="ruby-operator">|</span> <span class="ruby-identifier">d</span>.<span class="ruby-identifier">type</span> <span class="ruby-operator">==</span> <span class="ruby-value">:development</span> }
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>List of dependencies that are used for development</p>


        </div>





      </div>


      <div id="method-i-doc_dir" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-doc_dir" title="Link to this method">
                <span class="method-name">doc_dir</span>
                <span class="method-args">(type = nil)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="doc_dir-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1774</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">doc_dir</span>(<span class="ruby-identifier">type</span> = <span class="ruby-keyword">nil</span>)
  <span class="ruby-ivar">@doc_dir</span> <span class="ruby-operator">||=</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">join</span> <span class="ruby-identifier">base_dir</span>, <span class="ruby-string">&quot;doc&quot;</span>, <span class="ruby-identifier">full_name</span>

  <span class="ruby-keyword">if</span> <span class="ruby-identifier">type</span>
    <span class="ruby-constant">File</span>.<span class="ruby-identifier">join</span> <span class="ruby-ivar">@doc_dir</span>, <span class="ruby-identifier">type</span>
  <span class="ruby-keyword">else</span>
    <span class="ruby-ivar">@doc_dir</span>
  <span class="ruby-keyword">end</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns the full path to this spec’s documentation directory.  If <code>type</code> is given it will be appended to the end.  For example:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">doc_dir</span>      <span class="ruby-comment"># =&gt; &quot;/path/to/gem_repo/doc/a-1&quot;</span>

<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">doc_dir</span> <span class="ruby-string">&#39;ri&#39;</span> <span class="ruby-comment"># =&gt; &quot;/path/to/gem_repo/doc/a-1/ri&quot;</span>
</pre>


        </div>





      </div>


      <div id="method-i-executable" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-executable" title="Link to this method">
                <span class="method-name">executable</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="executable-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1804</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">executable</span>
  (<span class="ruby-identifier">val</span> = <span class="ruby-identifier">executables</span>) <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-identifier">val</span>.<span class="ruby-identifier">first</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Singular accessor for <a href="Specification.html#method-i-executables"><code>executables</code></a></p>


        </div>





      </div>


      <div id="method-i-executable-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-executable-3D" title="Link to this method">
                <span class="method-name">executable=</span>
                <span class="method-args">(o)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="executable-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1811</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">executable=</span>(<span class="ruby-identifier">o</span>)
  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">executables</span> = [<span class="ruby-identifier">o</span>]
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Singular accessor for <a href="Specification.html#method-i-executables"><code>executables</code></a></p>


        </div>





      </div>


      <div id="method-i-executables-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-executables-3D" title="Link to this method">
                <span class="method-name">executables=</span>
                <span class="method-args">(value)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="executables-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1818</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">executables=</span>(<span class="ruby-identifier">value</span>)
  <span class="ruby-ivar">@executables</span> = <span class="ruby-constant">Array</span>(<span class="ruby-identifier">value</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Sets executables to <code>value</code>, ensuring it is an array.</p>


        </div>





      </div>


      <div id="method-i-extensions-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-extensions-3D" title="Link to this method">
                <span class="method-name">extensions=</span>
                <span class="method-args">(extensions)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="extensions-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1825</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">extensions=</span>(<span class="ruby-identifier">extensions</span>)
  <span class="ruby-ivar">@extensions</span> = <span class="ruby-constant">Array</span> <span class="ruby-identifier">extensions</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Sets extensions to <code>extensions</code>, ensuring it is an array.</p>


        </div>





      </div>


      <div id="method-i-extra_rdoc_files-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-extra_rdoc_files-3D" title="Link to this method">
                <span class="method-name">extra_rdoc_files=</span>
                <span class="method-args">(files)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="extra_rdoc_files-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1832</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">extra_rdoc_files=</span>(<span class="ruby-identifier">files</span>)
  <span class="ruby-ivar">@extra_rdoc_files</span> = <span class="ruby-constant">Array</span> <span class="ruby-identifier">files</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Sets <a href="Specification.html#method-i-extra_rdoc_files"><code>extra_rdoc_files</code></a> to <code>files</code>, ensuring it is an array.</p>


        </div>





      </div>


      <div id="method-i-file_name" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-file_name" title="Link to this method">
                <span class="method-name">file_name</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="file_name-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1841</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">file_name</span>
  <span class="ruby-node">&quot;#{full_name}.gem&quot;</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>The default (generated) file name of the gem.  See also <a href="Specification.html#method-i-spec_name"><code>spec_name</code></a>.</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">file_name</span> <span class="ruby-comment"># =&gt; &quot;example-1.0.gem&quot;</span>
</pre>


        </div>





      </div>


      <div id="method-i-files-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-files-3D" title="Link to this method">
                <span class="method-name">files=</span>
                <span class="method-args">(files)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="files-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1848</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">files=</span>(<span class="ruby-identifier">files</span>)
  <span class="ruby-ivar">@files</span> = <span class="ruby-constant">Array</span> <span class="ruby-identifier">files</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Sets files to <code>files</code>, ensuring it is an array.</p>


        </div>





      </div>


      <div id="method-i-for_cache" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-for_cache" title="Link to this method">
                <span class="method-name">for_cache</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="for_cache-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1866</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">for_cache</span>
  <span class="ruby-identifier">spec</span> = <span class="ruby-identifier">dup</span>

  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">files</span> = <span class="ruby-keyword">nil</span>
  <span class="ruby-identifier">spec</span>.<span class="ruby-identifier">test_files</span> = <span class="ruby-keyword">nil</span>

  <span class="ruby-identifier">spec</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Creates a duplicate spec without large blobs that aren’t used at runtime.</p>


        </div>





      </div>


      <div id="method-i-gems_dir" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-gems_dir" title="Link to this method">
                <span class="method-name">gems_dir</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="gems_dir-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1883</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">gems_dir</span>
  <span class="ruby-ivar">@gems_dir</span> <span class="ruby-operator">||=</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">join</span>(<span class="ruby-identifier">base_dir</span>, <span class="ruby-string">&quot;gems&quot;</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          


        </div>





      </div>


      <div id="method-i-has_conflicts-3F" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-has_conflicts-3F" title="Link to this method">
                <span class="method-name">has_conflicts?</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="has_conflicts-3F-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1649</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">has_conflicts?</span>
  <span class="ruby-keyword">return</span> <span class="ruby-keyword">true</span> <span class="ruby-keyword">unless</span> <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">env_requirement</span>(<span class="ruby-identifier">name</span>).<span class="ruby-identifier">satisfied_by?</span>(<span class="ruby-identifier">version</span>)
  <span class="ruby-identifier">runtime_dependencies</span>.<span class="ruby-identifier">any?</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">dep</span><span class="ruby-operator">|</span>
    <span class="ruby-identifier">spec</span> = <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">loaded_specs</span>[<span class="ruby-identifier">dep</span>.<span class="ruby-identifier">name</span>]
    <span class="ruby-identifier">spec</span> <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-operator">!</span><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">satisfies_requirement?</span>(<span class="ruby-identifier">dep</span>)
  <span class="ruby-keyword">end</span>
<span class="ruby-keyword">rescue</span> <span class="ruby-constant">ArgumentError</span> <span class="ruby-operator">=&gt;</span> <span class="ruby-identifier">e</span>
  <span class="ruby-identifier">raise</span> <span class="ruby-identifier">e</span>, <span class="ruby-node">&quot;#{name} #{version}: #{e.message}&quot;</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Return true if there are possible conflicts against the currently loaded specs.</p>


        </div>





      </div>


      <div id="method-i-initialize_copy" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-initialize_copy" title="Link to this method">
                <span class="method-name">initialize_copy</span>
                <span class="method-args">(other_spec)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="initialize_copy-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1955</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">initialize_copy</span>(<span class="ruby-identifier">other_spec</span>)
  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">class</span>.<span class="ruby-identifier">array_attributes</span>.<span class="ruby-identifier">each</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">name</span><span class="ruby-operator">|</span>
    <span class="ruby-identifier">name</span> = <span class="ruby-value">:&quot;@#{name}&quot;</span>
    <span class="ruby-keyword">next</span> <span class="ruby-keyword">unless</span> <span class="ruby-identifier">other_spec</span>.<span class="ruby-identifier">instance_variable_defined?</span> <span class="ruby-identifier">name</span>

    <span class="ruby-keyword">begin</span>
      <span class="ruby-identifier">val</span> = <span class="ruby-identifier">other_spec</span>.<span class="ruby-identifier">instance_variable_get</span>(<span class="ruby-identifier">name</span>)
      <span class="ruby-keyword">if</span> <span class="ruby-identifier">val</span>
        <span class="ruby-identifier">instance_variable_set</span> <span class="ruby-identifier">name</span>, <span class="ruby-identifier">val</span>.<span class="ruby-identifier">dup</span>
      <span class="ruby-keyword">elsif</span> <span class="ruby-constant">Gem</span>.<span class="ruby-identifier">configuration</span>.<span class="ruby-identifier">really_verbose</span>
        <span class="ruby-identifier">warn</span> <span class="ruby-node">&quot;WARNING: #{full_name} has an invalid nil value for #{name}&quot;</span>
      <span class="ruby-keyword">end</span>
    <span class="ruby-keyword">rescue</span> <span class="ruby-constant">TypeError</span>
      <span class="ruby-identifier">e</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">FormatException</span>.<span class="ruby-identifier">new</span> \
        <span class="ruby-node">&quot;#{full_name} has an invalid value for #{name}&quot;</span>

      <span class="ruby-identifier">e</span>.<span class="ruby-identifier">file_path</span> = <span class="ruby-identifier">loaded_from</span>
      <span class="ruby-identifier">raise</span> <span class="ruby-identifier">e</span>
    <span class="ruby-keyword">end</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-ivar">@required_ruby_version</span> = <span class="ruby-identifier">other_spec</span>.<span class="ruby-identifier">required_ruby_version</span>.<span class="ruby-identifier">dup</span>
  <span class="ruby-ivar">@required_rubygems_version</span> = <span class="ruby-identifier">other_spec</span>.<span class="ruby-identifier">required_rubygems_version</span>.<span class="ruby-identifier">dup</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Duplicates Array and Gem::Requirement attributes from <code>other_spec</code> so state isn’t shared.</p>


        </div>





      </div>


      <div id="method-i-keep_only_files_and_directories" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-keep_only_files_and_directories" title="Link to this method">
                <span class="method-name">keep_only_files_and_directories</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="keep_only_files_and_directories-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2504</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">keep_only_files_and_directories</span>
  <span class="ruby-ivar">@executables</span>.<span class="ruby-identifier">delete_if</span>      {<span class="ruby-operator">|</span><span class="ruby-identifier">x</span><span class="ruby-operator">|</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">directory?</span>(<span class="ruby-constant">File</span>.<span class="ruby-identifier">join</span>(<span class="ruby-ivar">@bindir</span>, <span class="ruby-identifier">x</span>)) }
  <span class="ruby-ivar">@extensions</span>.<span class="ruby-identifier">delete_if</span>       {<span class="ruby-operator">|</span><span class="ruby-identifier">x</span><span class="ruby-operator">|</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">directory?</span>(<span class="ruby-identifier">x</span>) <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-operator">!</span><span class="ruby-constant">File</span>.<span class="ruby-identifier">symlink?</span>(<span class="ruby-identifier">x</span>) }
  <span class="ruby-ivar">@extra_rdoc_files</span>.<span class="ruby-identifier">delete_if</span> {<span class="ruby-operator">|</span><span class="ruby-identifier">x</span><span class="ruby-operator">|</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">directory?</span>(<span class="ruby-identifier">x</span>) <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-operator">!</span><span class="ruby-constant">File</span>.<span class="ruby-identifier">symlink?</span>(<span class="ruby-identifier">x</span>) }
  <span class="ruby-ivar">@files</span>.<span class="ruby-identifier">delete_if</span>            {<span class="ruby-operator">|</span><span class="ruby-identifier">x</span><span class="ruby-operator">|</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">directory?</span>(<span class="ruby-identifier">x</span>) <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-operator">!</span><span class="ruby-constant">File</span>.<span class="ruby-identifier">symlink?</span>(<span class="ruby-identifier">x</span>) }
  <span class="ruby-ivar">@test_files</span>.<span class="ruby-identifier">delete_if</span>       {<span class="ruby-operator">|</span><span class="ruby-identifier">x</span><span class="ruby-operator">|</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">directory?</span>(<span class="ruby-identifier">x</span>) <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-operator">!</span><span class="ruby-constant">File</span>.<span class="ruby-identifier">symlink?</span>(<span class="ruby-identifier">x</span>) }
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          


        </div>





      </div>


      <div id="method-i-lib_files" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-lib_files" title="Link to this method">
                <span class="method-name">lib_files</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="lib_files-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2000</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">lib_files</span>
  <span class="ruby-ivar">@files</span>.<span class="ruby-identifier">select</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">file</span><span class="ruby-operator">|</span>
    <span class="ruby-identifier">require_paths</span>.<span class="ruby-identifier">any?</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">path</span><span class="ruby-operator">|</span>
      <span class="ruby-identifier">file</span>.<span class="ruby-identifier">start_with?</span> <span class="ruby-identifier">path</span>
    <span class="ruby-keyword">end</span>
  <span class="ruby-keyword">end</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Files in the <a href="../Gem.html"><code>Gem</code></a> under one of the require_paths</p>


        </div>





      </div>


      <div id="method-i-license" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-license" title="Link to this method">
                <span class="method-name">license</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="license-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2011</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">license</span>
  <span class="ruby-identifier">licenses</span>.<span class="ruby-identifier">first</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Singular accessor for <a href="Specification.html#method-i-licenses"><code>licenses</code></a></p>


        </div>





      </div>


      <div id="method-i-licenses" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-licenses" title="Link to this method">
                <span class="method-name">licenses</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="licenses-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2020</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">licenses</span>
  <span class="ruby-ivar">@licenses</span> <span class="ruby-operator">||=</span> []
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Plural accessor for setting licenses</p>

<p>See <a href="Specification.html#method-i-license-3D"><code>license=</code></a> for details</p>


        </div>





      </div>


      <div id="method-i-missing_extensions-3F" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-missing_extensions-3F" title="Link to this method">
                <span class="method-name">missing_extensions?</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="missing_extensions-3F-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2055</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">missing_extensions?</span>
  <span class="ruby-keyword">return</span> <span class="ruby-keyword">false</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">extensions</span>.<span class="ruby-identifier">empty?</span>
  <span class="ruby-keyword">return</span> <span class="ruby-keyword">false</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">default_gem?</span>
  <span class="ruby-keyword">return</span> <span class="ruby-keyword">false</span> <span class="ruby-keyword">if</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">exist?</span> <span class="ruby-identifier">gem_build_complete_path</span>

  <span class="ruby-keyword">true</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Is this specification missing its extensions?  When this returns true you probably want to build_extensions</p>


        </div>





      </div>


      <div id="method-i-name_tuple" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-name_tuple" title="Link to this method">
                <span class="method-name">name_tuple</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="name_tuple-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2086</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">name_tuple</span>
  <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">NameTuple</span>.<span class="ruby-identifier">new</span> <span class="ruby-identifier">name</span>, <span class="ruby-identifier">version</span>, <span class="ruby-identifier">original_platform</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Return a NameTuple that represents this <a href="Specification.html"><code>Specification</code></a></p>


        </div>





      </div>


      <div id="method-i-normalize" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-normalize" title="Link to this method">
                <span class="method-name">normalize</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="normalize-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2069</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">normalize</span>
  <span class="ruby-keyword">if</span> <span class="ruby-keyword">defined?</span>(<span class="ruby-ivar">@extra_rdoc_files</span>) <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-ivar">@extra_rdoc_files</span>
    <span class="ruby-ivar">@extra_rdoc_files</span>.<span class="ruby-identifier">uniq!</span>
    <span class="ruby-ivar">@files</span> <span class="ruby-operator">||=</span> []
    <span class="ruby-ivar">@files</span>.<span class="ruby-identifier">concat</span>(<span class="ruby-ivar">@extra_rdoc_files</span>)
  <span class="ruby-keyword">end</span>

  <span class="ruby-ivar">@files</span>            = <span class="ruby-ivar">@files</span>.<span class="ruby-identifier">uniq</span>.<span class="ruby-identifier">sort</span> <span class="ruby-keyword">if</span> <span class="ruby-ivar">@files</span>
  <span class="ruby-ivar">@extensions</span>       = <span class="ruby-ivar">@extensions</span>.<span class="ruby-identifier">uniq</span>.<span class="ruby-identifier">sort</span> <span class="ruby-keyword">if</span> <span class="ruby-ivar">@extensions</span>
  <span class="ruby-ivar">@test_files</span>       = <span class="ruby-ivar">@test_files</span>.<span class="ruby-identifier">uniq</span>.<span class="ruby-identifier">sort</span> <span class="ruby-keyword">if</span> <span class="ruby-ivar">@test_files</span>
  <span class="ruby-ivar">@executables</span>      = <span class="ruby-ivar">@executables</span>.<span class="ruby-identifier">uniq</span>.<span class="ruby-identifier">sort</span> <span class="ruby-keyword">if</span> <span class="ruby-ivar">@executables</span>
  <span class="ruby-ivar">@extra_rdoc_files</span> = <span class="ruby-ivar">@extra_rdoc_files</span>.<span class="ruby-identifier">uniq</span>.<span class="ruby-identifier">sort</span> <span class="ruby-keyword">if</span> <span class="ruby-ivar">@extra_rdoc_files</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Normalize the list of files so that:</p>
<ul><li>
<p>All file lists have redundancies removed.</p>
</li><li>
<p>Files referenced in the <a href="Specification.html#method-i-extra_rdoc_files"><code>extra_rdoc_files</code></a> are included in the package file list.</p>
</li></ul>


        </div>





      </div>


      <div id="method-i-platform" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-platform" title="Link to this method">
                <span class="method-name">platform</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="platform-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2112</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">platform</span>
  <span class="ruby-ivar">@new_platform</span> <span class="ruby-operator">||=</span> <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span><span class="ruby-operator">::</span><span class="ruby-constant">RUBY</span> <span class="ruby-comment"># rubocop:disable Naming/MemoizedInstanceVariableName</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>The platform this gem runs on.  See Gem::Platform for details.</p>


        </div>





      </div>


      <div id="method-i-rdoc_options-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-rdoc_options-3D" title="Link to this method">
                <span class="method-name">rdoc_options=</span>
                <span class="method-args">(options)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="rdoc_options-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2178</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">rdoc_options=</span>(<span class="ruby-identifier">options</span>)
  <span class="ruby-ivar">@rdoc_options</span> = <span class="ruby-constant">Array</span> <span class="ruby-identifier">options</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Sets <a href="Specification.html#method-i-rdoc_options"><code>rdoc_options</code></a> to <code>value</code>, ensuring it is an array.</p>


        </div>





      </div>


      <div id="method-i-require_path" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-require_path" title="Link to this method">
                <span class="method-name">require_path</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="require_path-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2185</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">require_path</span>
  (<span class="ruby-identifier">val</span> = <span class="ruby-identifier">require_paths</span>) <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-identifier">val</span>.<span class="ruby-identifier">first</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Singular accessor for require_paths</p>


        </div>





      </div>


      <div id="method-i-require_path-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-require_path-3D" title="Link to this method">
                <span class="method-name">require_path=</span>
                <span class="method-args">(path)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="require_path-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2192</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">require_path=</span>(<span class="ruby-identifier">path</span>)
  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">require_paths</span> = <span class="ruby-constant">Array</span>(<span class="ruby-identifier">path</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Singular accessor for require_paths</p>


        </div>





      </div>


      <div id="method-i-requirements-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-requirements-3D" title="Link to this method">
                <span class="method-name">requirements=</span>
                <span class="method-args">(req)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="requirements-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2199</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">requirements=</span>(<span class="ruby-identifier">req</span>)
  <span class="ruby-ivar">@requirements</span> = <span class="ruby-constant">Array</span> <span class="ruby-identifier">req</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Set requirements to <code>req</code>, ensuring it is an array.</p>


        </div>





      </div>


      <div id="method-i-reset_nil_attributes_to_default" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-reset_nil_attributes_to_default" title="Link to this method">
                <span class="method-name">reset_nil_attributes_to_default</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="reset_nil_attributes_to_default-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2544</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">reset_nil_attributes_to_default</span>
  <span class="ruby-identifier">nil_attributes</span> = <span class="ruby-keyword">self</span>.<span class="ruby-identifier">class</span>.<span class="ruby-identifier">non_nil_attributes</span>.<span class="ruby-identifier">find_all</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">name</span><span class="ruby-operator">|</span>
    <span class="ruby-operator">!</span><span class="ruby-identifier">instance_variable_defined?</span>(<span class="ruby-node">&quot;@#{name}&quot;</span>) <span class="ruby-operator">||</span> <span class="ruby-identifier">instance_variable_get</span>(<span class="ruby-node">&quot;@#{name}&quot;</span>).<span class="ruby-identifier">nil?</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-identifier">nil_attributes</span>.<span class="ruby-identifier">each</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">attribute</span><span class="ruby-operator">|</span>
    <span class="ruby-identifier">default</span> = <span class="ruby-identifier">default_value</span> <span class="ruby-identifier">attribute</span>

    <span class="ruby-identifier">value</span> = <span class="ruby-keyword">case</span> <span class="ruby-identifier">default</span>
            <span class="ruby-keyword">when</span> <span class="ruby-constant">Time</span>, <span class="ruby-constant">Numeric</span>, <span class="ruby-constant">Symbol</span>, <span class="ruby-keyword">true</span>, <span class="ruby-keyword">false</span>, <span class="ruby-keyword">nil</span> <span class="ruby-keyword">then</span> <span class="ruby-identifier">default</span>
            <span class="ruby-keyword">else</span> <span class="ruby-identifier">default</span>.<span class="ruby-identifier">dup</span>
    <span class="ruby-keyword">end</span>

    <span class="ruby-identifier">instance_variable_set</span> <span class="ruby-node">&quot;@#{attribute}&quot;</span>, <span class="ruby-identifier">value</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-ivar">@installed_by_version</span> <span class="ruby-operator">||=</span> <span class="ruby-keyword">nil</span>

  <span class="ruby-keyword">nil</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Reset nil attributes to their default values to make the spec valid</p>


        </div>





      </div>


      <div id="method-i-ri_dir" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-ri_dir" title="Link to this method">
                <span class="method-name">ri_dir</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="ri_dir-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2210</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">ri_dir</span>
  <span class="ruby-ivar">@ri_dir</span> <span class="ruby-operator">||=</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">join</span> <span class="ruby-identifier">base_dir</span>, <span class="ruby-string">&quot;ri&quot;</span>, <span class="ruby-identifier">full_name</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns the full path to this spec’s ri directory.</p>


        </div>





      </div>


      <div id="method-i-runtime_dependencies" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-runtime_dependencies" title="Link to this method">
                <span class="method-name">runtime_dependencies</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="runtime_dependencies-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2243</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">runtime_dependencies</span>
  <span class="ruby-identifier">dependencies</span>.<span class="ruby-identifier">select</span>(<span class="ruby-operator">&amp;</span><span class="ruby-value">:runtime?</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>List of dependencies that will automatically be activated at runtime.</p>


        </div>





      </div>


      <div id="method-i-sanitize" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-sanitize" title="Link to this method">
                <span class="method-name">sanitize</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="sanitize-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1439</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">sanitize</span>
  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">summary</span>              = <span class="ruby-identifier">sanitize_string</span>(<span class="ruby-identifier">summary</span>)
  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">description</span>          = <span class="ruby-identifier">sanitize_string</span>(<span class="ruby-identifier">description</span>)
  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">post_install_message</span> = <span class="ruby-identifier">sanitize_string</span>(<span class="ruby-identifier">post_install_message</span>)
  <span class="ruby-keyword">self</span>.<span class="ruby-identifier">authors</span>              = <span class="ruby-identifier">authors</span>.<span class="ruby-identifier">collect</span> {<span class="ruby-operator">|</span><span class="ruby-identifier">a</span><span class="ruby-operator">|</span> <span class="ruby-identifier">sanitize_string</span>(<span class="ruby-identifier">a</span>) }
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Sanitize the descriptive fields in the spec.  Sometimes non-ASCII characters will garble the site index.  Non-ASCII characters will be replaced by their XML entity equivalent.</p>


        </div>





      </div>


      <div id="method-i-sanitize_string" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-sanitize_string" title="Link to this method">
                <span class="method-name">sanitize_string</span>
                <span class="method-args">(string)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="sanitize_string-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 1449</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">sanitize_string</span>(<span class="ruby-identifier">string</span>)
  <span class="ruby-keyword">return</span> <span class="ruby-identifier">string</span> <span class="ruby-keyword">unless</span> <span class="ruby-identifier">string</span>

  <span class="ruby-comment"># HACK: the #to_s is in here because RSpec has an Array of Arrays of</span>
  <span class="ruby-comment"># Strings for authors.  Need a way to disallow bad values on gemspec</span>
  <span class="ruby-comment"># generation.  (Probably won&#39;t happen.)</span>
  <span class="ruby-identifier">string</span>.<span class="ruby-identifier">to_s</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Sanitize a single string.</p>


        </div>





      </div>


      <div id="method-i-satisfies_requirement-3F" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-satisfies_requirement-3F" title="Link to this method">
                <span class="method-name">satisfies_requirement?</span>
                <span class="method-args">(dependency)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="satisfies_requirement-3F-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2259</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">satisfies_requirement?</span>(<span class="ruby-identifier">dependency</span>)
  <span class="ruby-ivar">@name</span> <span class="ruby-operator">==</span> <span class="ruby-identifier">dependency</span>.<span class="ruby-identifier">name</span> <span class="ruby-operator">&amp;&amp;</span>
    <span class="ruby-identifier">dependency</span>.<span class="ruby-identifier">requirement</span>.<span class="ruby-identifier">satisfied_by?</span>(<span class="ruby-ivar">@version</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Checks if this specification meets the requirement of <code>dependency</code>.</p>


        </div>





      </div>


      <div id="method-i-sort_obj" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-sort_obj" title="Link to this method">
                <span class="method-name">sort_obj</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="sort_obj-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2267</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">sort_obj</span>
  [<span class="ruby-ivar">@name</span>, <span class="ruby-ivar">@version</span>, <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span>.<span class="ruby-identifier">sort_priority</span>(<span class="ruby-ivar">@new_platform</span>)]
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns an object you can use to sort specifications in sort_by.</p>


        </div>





      </div>


      <div id="method-i-spec_dir" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-spec_dir" title="Link to this method">
                <span class="method-name">spec_dir</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="spec_dir-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2282</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">spec_dir</span>
  <span class="ruby-ivar">@spec_dir</span> <span class="ruby-operator">||=</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">join</span> <span class="ruby-identifier">base_dir</span>, <span class="ruby-string">&quot;specifications&quot;</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns the full path to the directory containing this spec’s gemspec file. eg: /usr/local/lib/ruby/gems/1.8/specifications</p>


        </div>





      </div>


      <div id="method-i-spec_file" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-spec_file" title="Link to this method">
                <span class="method-name">spec_file</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="spec_file-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2290</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">spec_file</span>
  <span class="ruby-ivar">@spec_file</span> <span class="ruby-operator">||=</span> <span class="ruby-constant">File</span>.<span class="ruby-identifier">join</span> <span class="ruby-identifier">spec_dir</span>, <span class="ruby-node">&quot;#{full_name}.gemspec&quot;</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns the full path to this spec’s gemspec file. eg: /usr/local/lib/ruby/gems/1.8/specifications/mygem-1.0.gemspec</p>


        </div>





      </div>


      <div id="method-i-spec_name" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-spec_name" title="Link to this method">
                <span class="method-name">spec_name</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="spec_name-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2299</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">spec_name</span>
  <span class="ruby-node">&quot;#{full_name}.gemspec&quot;</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>The default name of the gemspec.  See also <a href="Specification.html#method-i-file_name"><code>file_name</code></a></p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">spec_name</span> <span class="ruby-comment"># =&gt; &quot;example-1.0.gemspec&quot;</span>
</pre>


        </div>





      </div>


      <div id="method-i-stubbed-3F" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-stubbed-3F" title="Link to this method">
                <span class="method-name">stubbed?</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="stubbed-3F-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2523</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">stubbed?</span>
  <span class="ruby-keyword">false</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          


        </div>





      </div>


      <div id="method-i-summary-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-summary-3D" title="Link to this method">
                <span class="method-name">summary=</span>
                <span class="method-args">(str)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="summary-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2306</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">summary=</span>(<span class="ruby-identifier">str</span>)
  <span class="ruby-ivar">@summary</span> = <span class="ruby-identifier">str</span>.<span class="ruby-identifier">to_s</span>.<span class="ruby-identifier">strip</span>.
    <span class="ruby-identifier">gsub</span>(<span class="ruby-regexp">/(\w-)\n[ \t]*(\w)/</span>, <span class="ruby-string">&#39;\1\2&#39;</span>).<span class="ruby-identifier">gsub</span>(<span class="ruby-regexp">/\n[ \t]*/</span>, <span class="ruby-string">&quot; &quot;</span>) <span class="ruby-comment"># so. weird.</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>A short summary of this gem’s description.</p>


        </div>





      </div>


      <div id="method-i-to_ruby" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-to_ruby" title="Link to this method">
                <span class="method-name">to_ruby</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="to_ruby-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2349</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">to_ruby</span>
  <span class="ruby-identifier">result</span> = []
  <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&quot;# -*- encoding: utf-8 -*-&quot;</span>
  <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-node">&quot;#{Gem::StubSpecification::PREFIX}#{name} #{version} #{platform} #{raw_require_paths.join(&quot;\0&quot;)}&quot;</span>
  <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-node">&quot;#{Gem::StubSpecification::PREFIX}#{extensions.join &quot;\0&quot;}&quot;</span> <span class="ruby-keyword">unless</span>
    <span class="ruby-identifier">extensions</span>.<span class="ruby-identifier">empty?</span>
  <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-keyword">nil</span>
  <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&quot;Gem::Specification.new do |s|&quot;</span>

  <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-node">&quot;  s.name = #{ruby_code name}&quot;</span>
  <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-node">&quot;  s.version = #{ruby_code version}&quot;</span>
  <span class="ruby-keyword">unless</span> <span class="ruby-identifier">platform</span>.<span class="ruby-identifier">nil?</span> <span class="ruby-operator">||</span> <span class="ruby-identifier">platform</span> <span class="ruby-operator">==</span> <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span><span class="ruby-operator">::</span><span class="ruby-constant">RUBY</span>
    <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-node">&quot;  s.platform = #{ruby_code original_platform}&quot;</span>
  <span class="ruby-keyword">end</span>
  <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&quot;&quot;</span>
  <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-node">&quot;  s.required_rubygems_version = #{ruby_code required_rubygems_version} if s.respond_to? :required_rubygems_version=&quot;</span>

  <span class="ruby-keyword">if</span> <span class="ruby-identifier">metadata</span> <span class="ruby-operator">&amp;&amp;</span> <span class="ruby-operator">!</span><span class="ruby-identifier">metadata</span>.<span class="ruby-identifier">empty?</span>
    <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-node">&quot;  s.metadata = #{ruby_code metadata} if s.respond_to? :metadata=&quot;</span>
  <span class="ruby-keyword">end</span>
  <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-node">&quot;  s.require_paths = #{ruby_code raw_require_paths}&quot;</span>

  <span class="ruby-identifier">handled</span> = [
    <span class="ruby-value">:dependencies</span>,
    <span class="ruby-value">:name</span>,
    <span class="ruby-value">:platform</span>,
    <span class="ruby-value">:require_paths</span>,
    <span class="ruby-value">:required_rubygems_version</span>,
    <span class="ruby-value">:specification_version</span>,
    <span class="ruby-value">:version</span>,
    <span class="ruby-value">:metadata</span>,
    <span class="ruby-value">:signing_key</span>,
  ]

  <span class="ruby-identifier">@@attributes</span>.<span class="ruby-identifier">each</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">attr_name</span><span class="ruby-operator">|</span>
    <span class="ruby-keyword">next</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">handled</span>.<span class="ruby-identifier">include?</span> <span class="ruby-identifier">attr_name</span>
    <span class="ruby-identifier">current_value</span> = <span class="ruby-identifier">send</span>(<span class="ruby-identifier">attr_name</span>)
    <span class="ruby-keyword">if</span> <span class="ruby-identifier">current_value</span> <span class="ruby-operator">!=</span> <span class="ruby-identifier">default_value</span>(<span class="ruby-identifier">attr_name</span>) <span class="ruby-operator">||</span> <span class="ruby-keyword">self</span>.<span class="ruby-identifier">class</span>.<span class="ruby-identifier">required_attribute?</span>(<span class="ruby-identifier">attr_name</span>)
      <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-node">&quot;  s.#{attr_name} = #{ruby_code current_value}&quot;</span>
    <span class="ruby-keyword">end</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-keyword">if</span> <span class="ruby-constant">String</span> <span class="ruby-operator">===</span> <span class="ruby-identifier">signing_key</span>
    <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-node">&quot;  s.signing_key = #{ruby_code signing_key}&quot;</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-keyword">if</span> <span class="ruby-ivar">@installed_by_version</span>
    <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-keyword">nil</span>
    <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-node">&quot;  s.installed_by_version = #{ruby_code Gem::VERSION}&quot;</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-keyword">unless</span> <span class="ruby-identifier">dependencies</span>.<span class="ruby-identifier">empty?</span>
    <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-keyword">nil</span>
    <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-node">&quot;  s.specification_version = #{specification_version}&quot;</span>
    <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-keyword">nil</span>

    <span class="ruby-identifier">dependencies</span>.<span class="ruby-identifier">each</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">dep</span><span class="ruby-operator">|</span>
      <span class="ruby-identifier">dep</span>.<span class="ruby-identifier">instance_variable_set</span> <span class="ruby-value">:@type</span>, <span class="ruby-value">:runtime</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">dep</span>.<span class="ruby-identifier">type</span>.<span class="ruby-identifier">nil?</span> <span class="ruby-comment"># HACK</span>
      <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-node">&quot;  s.add_#{dep.type}_dependency(%q&lt;#{dep.name}&gt;.freeze, #{ruby_code dep.requirements_list})&quot;</span>
    <span class="ruby-keyword">end</span>
  <span class="ruby-keyword">end</span>

  <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&quot;end&quot;</span>
  <span class="ruby-identifier">result</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-keyword">nil</span>

  <span class="ruby-identifier">result</span>.<span class="ruby-identifier">join</span> <span class="ruby-string">&quot;\n&quot;</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns a Ruby code representation of this specification, such that it can be eval’ed and reconstruct the same specification later.  Attributes that still have their default values are omitted.</p>


        </div>





      </div>


      <div id="method-i-to_ruby_for_cache" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-to_ruby_for_cache" title="Link to this method">
                <span class="method-name">to_ruby_for_cache</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="to_ruby_for_cache-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2423</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">to_ruby_for_cache</span>
  <span class="ruby-identifier">for_cache</span>.<span class="ruby-identifier">to_ruby</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns a Ruby lighter-weight code representation of this specification, used for indexing only.</p>

<p>See <a href="Specification.html#method-i-to_ruby"><code>to_ruby</code></a>.</p>


        </div>





      </div>


      <div id="method-i-to_spec" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-to_spec" title="Link to this method">
                <span class="method-name">to_spec</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="to_spec-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2434</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">to_spec</span>
  <span class="ruby-keyword">self</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Returns self</p>


        </div>





      </div>


      <div id="method-i-traverse" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-traverse" title="Link to this method">
                <span class="method-name">traverse</span>
                <span class="method-args">(trail = [], visited = {}, &amp;block)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="traverse-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2465</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">traverse</span>(<span class="ruby-identifier">trail</span> = [], <span class="ruby-identifier">visited</span> = {}, <span class="ruby-operator">&amp;</span><span class="ruby-identifier">block</span>)
  <span class="ruby-identifier">trail</span>.<span class="ruby-identifier">push</span>(<span class="ruby-keyword">self</span>)
  <span class="ruby-keyword">begin</span>
    <span class="ruby-identifier">runtime_dependencies</span>.<span class="ruby-identifier">each</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">dep</span><span class="ruby-operator">|</span>
      <span class="ruby-identifier">dep</span>.<span class="ruby-identifier">matching_specs</span>(<span class="ruby-keyword">true</span>).<span class="ruby-identifier">each</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">dep_spec</span><span class="ruby-operator">|</span>
        <span class="ruby-keyword">next</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">visited</span>.<span class="ruby-identifier">key?</span>(<span class="ruby-identifier">dep_spec</span>)
        <span class="ruby-identifier">visited</span>[<span class="ruby-identifier">dep_spec</span>] = <span class="ruby-keyword">true</span>
        <span class="ruby-identifier">trail</span>.<span class="ruby-identifier">push</span>(<span class="ruby-identifier">dep_spec</span>)
        <span class="ruby-keyword">begin</span>
          <span class="ruby-identifier">result</span> = <span class="ruby-identifier">block</span>[<span class="ruby-keyword">self</span>, <span class="ruby-identifier">dep</span>, <span class="ruby-identifier">dep_spec</span>, <span class="ruby-identifier">trail</span>]
        <span class="ruby-keyword">ensure</span>
          <span class="ruby-identifier">trail</span>.<span class="ruby-identifier">pop</span>
        <span class="ruby-keyword">end</span>
        <span class="ruby-keyword">next</span> <span class="ruby-keyword">if</span> <span class="ruby-identifier">result</span> <span class="ruby-operator">==</span> <span class="ruby-value">:next</span>
        <span class="ruby-identifier">spec_name</span> = <span class="ruby-identifier">dep_spec</span>.<span class="ruby-identifier">name</span>
        <span class="ruby-identifier">dep_spec</span>.<span class="ruby-identifier">traverse</span>(<span class="ruby-identifier">trail</span>, <span class="ruby-identifier">visited</span>, <span class="ruby-operator">&amp;</span><span class="ruby-identifier">block</span>) <span class="ruby-keyword">unless</span>
          <span class="ruby-identifier">trail</span>.<span class="ruby-identifier">any?</span> {<span class="ruby-operator">|</span><span class="ruby-identifier">s</span><span class="ruby-operator">|</span> <span class="ruby-identifier">s</span>.<span class="ruby-identifier">name</span> <span class="ruby-operator">==</span> <span class="ruby-identifier">spec_name</span> }
      <span class="ruby-keyword">end</span>
    <span class="ruby-keyword">end</span>
  <span class="ruby-keyword">ensure</span>
    <span class="ruby-identifier">trail</span>.<span class="ruby-identifier">pop</span>
  <span class="ruby-keyword">end</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Recursively walk dependencies of this spec, executing the <code>block</code> for each hop.</p>


        </div>





      </div>


      <div id="method-i-validate" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-validate" title="Link to this method">
                <span class="method-name">validate</span>
                <span class="method-args">(packaging = true, strict = false)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="validate-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2496</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">validate</span>(<span class="ruby-identifier">packaging</span> = <span class="ruby-keyword">true</span>, <span class="ruby-identifier">strict</span> = <span class="ruby-keyword">false</span>)
  <span class="ruby-identifier">normalize</span>

  <span class="ruby-identifier">validation_policy</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">SpecificationPolicy</span>.<span class="ruby-identifier">new</span>(<span class="ruby-keyword">self</span>)
  <span class="ruby-identifier">validation_policy</span>.<span class="ruby-identifier">packaging</span> = <span class="ruby-identifier">packaging</span>
  <span class="ruby-identifier">validation_policy</span>.<span class="ruby-identifier">validate</span>(<span class="ruby-identifier">strict</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Checks that the specification contains all required fields, and does a very basic sanity check.</p>

<p>Raises InvalidSpecificationException if the spec does not pass the checks..</p>


        </div>





      </div>


      <div id="method-i-validate_for_resolution" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-validate_for_resolution" title="Link to this method">
                <span class="method-name">validate_for_resolution</span>
                <span class="method-args">()</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="validate_for_resolution-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2512</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">validate_for_resolution</span>
  <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">SpecificationPolicy</span>.<span class="ruby-identifier">new</span>(<span class="ruby-keyword">self</span>).<span class="ruby-identifier">validate_for_resolution</span>
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          


        </div>





      </div>


      <div id="method-i-version-3D" class="method-detail anchor-link ">
        <div class="method-header">

            <div class="method-heading">
              <a href="#method-i-version-3D" title="Link to this method">
                <span class="method-name">version=</span>
                <span class="method-args">(version)</span>
              </a>
            </div>

        </div>


          <div class="method-controls">
            <details class="method-source-toggle">
              <summary>Source</summary>
            </details>
          </div>
          <div class="method-source-code" id="version-3D-source">
            <pre class="ruby"><span class="ruby-comment"># File ../../lib/rubygems/specification.rb, line 2519</span>
<span class="ruby-keyword">def</span> <span class="ruby-identifier ruby-title">version=</span>(<span class="ruby-identifier">version</span>)
  <span class="ruby-ivar">@version</span> = <span class="ruby-identifier">version</span>.<span class="ruby-identifier">nil?</span> <span class="ruby-operator">?</span> <span class="ruby-identifier">version</span> <span class="ruby-operator">:</span> <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Version</span>.<span class="ruby-identifier">create</span>(<span class="ruby-identifier">version</span>)
<span class="ruby-keyword">end</span></pre>
          </div>



        <div class="method-description">


          <p>Set the version to <code>version</code>.</p>


        </div>





      </div>


    </section>




  </section>

</main>

<aside class="table-of-contents" role="complementary" aria-label="Table of Contents">
  <div class="toc-sticky">
    <h3 class="toc-heading">On This Page</h3>
    <nav class="toc-nav" id="toc-nav" aria-label="Page sections">
      <!-- Generated by JavaScript based on page headings -->
    </nav>
  </div>
</aside>


<footer class="site-footer">
  

  <div class="footer-bottom">
    <p>
      Generated by <a href="https://ruby.github.io/rdoc/">RDoc 7.1.0</a>
      using the Aliki theme by <a href="http://st0012.dev">Stan Lo</a>
    </p>
  </div>
</footer>

</body>

