const mix = require('laravel-mix');

mix.styles([
	'assets/css/flag-icon-css/all.css',
	'assets/css/flag-icon-css/style.css',
	'assets/vendors/@coreui/icons/css/coreui-icons.min.css',
	'assets/vendors/@coreui/icons/css/coreui-icons.min.css.map',
	'assets/vendors/font-awesome/css/font-awesome.min.css',
	'assets/vendors/pace-progress/css/pace.css',
	'assets/vendors/pace-progress/css/pace.min.css',
	'assets/vendors/simple-line-icons/css/simple-line-icons.css',
	'assets/vendors/img/brand/logo.svg',
	'assets/vendors/img/brand/sygnet.svg',
	'assets/css/coreui/style.css',
	'assets/css/leaflet.css',
	'assets/css/style.css',
	], 'public/assets/css/all.css');
mix.scripts([
	'assets/vendors/jquery/js/jquery.min.js',
	'assets/vendors/popper.js/js/popper.min.js',
	'assets/vendors/boostrap/js/boostrap.min.js',
	'assets/vendors/boostrap/js/boostrap.min.js.map',
	'assets/vendors/pace-progress/js/pace.min.js',
	'assets/vendors/perfect-scrollbar/js/perfect-scrollbar.min.js',
	'assets/vendors/@coreui/@coreui-plugin-chartjs-custom-tooltips/js/custom-tooltips.min.js',
	'assets/vendors/@coreui/@coreui-plugin-chartjs-custom-tooltips/js/custom-tooltips.min.js.map',
	'assets/vendors/perfect-scrollbar/js/perfect-scrollbar.min.js',
	'assets/js/coreui/script.js',
	'assets/vendors/chartjs/chart.min.js',
	'assets/js/chart_noxus.js',
	'assets/js/map_noxus.js',
	'assets/js/main_core.js',
	], 'public/assets/js/all.js');
mix.scripts([
	'assets/js/leaflet.js',
	], 'public/assets/js/header-script.js');
mix.styles([
	'assets/css/bootstrap.min.css',
	'assets/vendors/font-awesome/css/font-awesome.min.css',
	'assets/css/font-awesome.min.css',
	'assets/css/slick.min.css',
	'assets/css/background/style.css',
	], 'public/assets/css/frnd.css');
mix.scripts([
	'assets/vendors/jquery/js/jquery.min.js',
	'assets/js/slick.min.js',
	'assets/js/frontend-settings.js',
	], 'public/assets/js/frnd.js');
