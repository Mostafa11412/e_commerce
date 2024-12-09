// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_Manager.dart' as _i841;
import '../data/dao/dataSourceContract/auth_dataSource/auth_dataSource.dart'
    as _i554;
import '../data/dao/dataSourceContract/brands_dataSource/brands_dataSource.dart'
    as _i822;
import '../data/dao/dataSourceContract/cart_dataSource/cartDataSource.dart'
    as _i356;
import '../data/dao/dataSourceContract/catogries_dataSource/categories_dataSource.dart'
    as _i329;
import '../data/dao/dataSourceContract/favorites_dataSource/favorites_dataSource.dart'
    as _i146;
import '../data/dao/dataSourceContract/payment_dataSource/payment_dataSource.dart'
    as _i91;
import '../data/dao/dataSourceContract/products_dataSource/product_dataSource.dart'
    as _i581;
import '../data/dao/dataSourceContract/subCategories_dataSource/subCategories_dataSource.dart'
    as _i671;
import '../data/dao/dataSourceimpl/auth_dataSource_impl/auth_dataSource_impl.dart'
    as _i722;
import '../data/dao/dataSourceimpl/brands_dataSource_Impl/brands_dataSource_Impl.dart'
    as _i864;
import '../data/dao/dataSourceimpl/cart_dataSource_Impl/cartDataSourceImpl.dart'
    as _i1035;
import '../data/dao/dataSourceimpl/categories_dataSource_Impl.dart/categories_dataSource_Impl.dart'
    as _i730;
import '../data/dao/dataSourceimpl/favorites_dataSource_Impl/favorites_dataSource_Impl.dart'
    as _i302;
import '../data/dao/dataSourceimpl/payment_dataSource_impl/payment_dataSource_impl.dart'
    as _i545;
import '../data/dao/dataSourceimpl/products_dataSource_impl/products_dataSource_impl.dart'
    as _i776;
import '../data/dao/dataSourceimpl/subCatogries_dataSource_impl/subCatogries_dataSourceimpl.dart'
    as _i301;
import '../data/repository_impl/auth_repo_impl/auth_repo_impl.dart' as _i813;
import '../data/repository_impl/brands_repo_impl/brands_repo_impl.dart'
    as _i928;
import '../data/repository_impl/cart_repo_impl/cartRepoImpl.dart' as _i238;
import '../data/repository_impl/catogries_repo_impl/catogries_repo_impl.dart'
    as _i759;
import '../data/repository_impl/favorites_repo_impl/favorites_repo_impl.dart'
    as _i885;
import '../data/repository_impl/payment_repo_impl/payment_repo_impl.dart'
    as _i411;
import '../data/repository_impl/products_repo_impl/products_repo_impl.dart'
    as _i239;
import '../data/repository_impl/subCatogries_repo_impl/subCatogries_repo_impl.dart'
    as _i501;
import '../domain/repository_contract/auth_repo/auth_repo.dart' as _i92;
import '../domain/repository_contract/brands_repo/brands_repo.dart' as _i627;
import '../domain/repository_contract/cart_repo/cartRepo.dart' as _i1035;
import '../domain/repository_contract/catogries_repo/catogries_repo.dart'
    as _i37;
import '../domain/repository_contract/favorites_repo/favorites_repo.dart'
    as _i63;
import '../domain/repository_contract/payment_repo/payment_repo.dart' as _i1050;
import '../domain/repository_contract/products_repo/products_repo.dart'
    as _i399;
import '../domain/repository_contract/subCatogries_repo/subCatogries_repo.dart'
    as _i459;
import '../domain/usecases/cartUseCases/addProduct_toCart_useCase.dart' as _i172;
import '../domain/usecases/favoritesUseCases/addRemoveProduct_toFavorits_useCase.dart' as _i399;
import '../domain/usecases/cartUseCases/clearCart_useCase.dart' as _i461;
import '../domain/usecases/get_brands_useCase.dart' as _i301;
import '../domain/usecases/cartUseCases/get_cart_useCase.dart' as _i390;
import '../domain/usecases/get_catogries_useCase.dart' as _i422;
import '../domain/usecases/productUseCases/get_mostSelling_products_UseCase.dart' as _i717;
import '../domain/usecases/productUseCases/get_products_onBrands_UseCase.dart' as _i590;
import '../domain/usecases/productUseCases/get_products_onCategory_UseCase.dart' as _i810;
import '../domain/usecases/productUseCases/get_products_onSubCategory_UseCase copy.dart'
    as _i406;
import '../domain/usecases/get_SubCatogries_onCategory_useCase.dart' as _i468;
import '../domain/usecases/favoritesUseCases/getFavorites_useCase.dart' as _i558;
import '../domain/usecases/productUseCases/getProductsForSearch.dart' as _i886;
import '../domain/usecases/paymentUseCases/getAuthToken_useCase.dart' as _i881;
import '../domain/usecases/paymentUseCases/getOrderIdUseCase.dart' as _i665;
import '../domain/usecases/paymentUseCases/getPaymentKeyUseCase.dart' as _i315;
import '../domain/usecases/cartUseCases/removeCartProduct_useCase.dart' as _i708;
import '../domain/usecases/productUseCases/removeProduct_toFavorits_useCase copy.dart'
    as _i532;
import '../domain/usecases/authUseCases/signIn_useCase.dart' as _i111;
import '../domain/usecases/authUseCases/signUp_useCase.dart' as _i359;
import '../domain/usecases/productUseCases/updateProductCount_useCase.dart' as _i601;
import '../presentation/cart/viewModel/cartViewModel.dart' as _i718;
import '../presentation/home/homeScreen_viewModel.dart' as _i836;
import '../presentation/home/tabs/catogriesTab/viewModel/catogriesViewModel.dart'
    as _i245;
import '../presentation/home/tabs/favoriteTab/viewModel/favoritesViewModel.dart'
    as _i965;
import '../presentation/home/tabs/homeTab/viewModel/homeTab_viewModel.dart'
    as _i906;
import '../presentation/payment/viewmodel/paymentViewModel.dart' as _i582;
import '../presentation/product/viewmodel/productsViewmodel.dart' as _i871;
import '../presentation/signIn/sigInViewModel.dart' as _i144;
import '../presentation/signUp/signUpViewModel.dart' as _i1018;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i841.ApiManager>(() => _i841.ApiManager());
    gh.factory<_i356.CartDataSource>(
        () => _i1035.CartDataSourceImpl(gh<_i841.ApiManager>()));
    gh.factory<_i554.AuthDataSource>(
        () => _i722.AuthDataSourceImpl(gh<_i841.ApiManager>()));
    gh.factory<_i581.ProductsDataSource>(
        () => _i776.ProductsDatasourceImpl(gh<_i841.ApiManager>()));
    gh.factory<_i399.ProductsRepo>(
        () => _i239.ProductsRepoImpl(gh<_i581.ProductsDataSource>()));
    gh.factory<_i329.CategoriesDataSource>(
        () => _i730.CategoriesDataSourceImpl(gh<_i841.ApiManager>()));
    gh.factory<_i1035.CartRepo>(
        () => _i238.CartRepoImpl(gh<_i356.CartDataSource>()));
    gh.factory<_i172.AddProductToCartUseCase>(
        () => _i172.AddProductToCartUseCase(gh<_i1035.CartRepo>()));
    gh.factory<_i461.ClearCartUseCase>(
        () => _i461.ClearCartUseCase(gh<_i1035.CartRepo>()));
    gh.factory<_i390.GetCartUsecase>(
        () => _i390.GetCartUsecase(gh<_i1035.CartRepo>()));
    gh.factory<_i708.RemoveCartProductUseCase>(
        () => _i708.RemoveCartProductUseCase(gh<_i1035.CartRepo>()));
    gh.factory<_i601.UpdateProductCountUseCase>(
        () => _i601.UpdateProductCountUseCase(gh<_i1035.CartRepo>()));
    gh.factory<_i91.PaymentDataSource>(
        () => _i545.PaymentDatasourceImpl(gh<_i841.ApiManager>()));
    gh.factory<_i671.SubcategoriesDataSource>(
        () => _i301.SubcatogriesDatasourceimpl(gh<_i841.ApiManager>()));
    gh.factory<_i822.BrandsDataSource>(
        () => _i864.BrandsDataSourceImpl(gh<_i841.ApiManager>()));
    gh.factory<_i146.FavoritesDataSource>(
        () => _i302.FavoritesDataSourceImpl(gh<_i841.ApiManager>()));
    gh.factory<_i459.SubcatogriesRepo>(
        () => _i501.SubcatogriesRepoImpl(gh<_i671.SubcategoriesDataSource>()));
    gh.factory<_i627.BrandsRepo>(
        () => _i928.BrandsRepoImpl(gh<_i822.BrandsDataSource>()));
    gh.factory<_i92.AuthRepo>(
        () => _i813.AuthRepoImpl(gh<_i554.AuthDataSource>()));
    gh.factory<_i37.Catogriesrepo>(
        () => _i759.CatogriesRepoImpl(gh<_i329.CategoriesDataSource>()));
    gh.factory<_i1050.PaymentRepo>(
        () => _i411.PaymentRepoImpl(gh<_i91.PaymentDataSource>()));
    gh.factory<_i718.CartViewModel>(() => _i718.CartViewModel(
          gh<_i390.GetCartUsecase>(),
          gh<_i601.UpdateProductCountUseCase>(),
          gh<_i708.RemoveCartProductUseCase>(),
          gh<_i461.ClearCartUseCase>(),
        ));
    gh.factory<_i886.GetproductsForSearch>(
        () => _i886.GetproductsForSearch(gh<_i399.ProductsRepo>()));
    gh.factory<_i717.GetMostsellingProductsUsecase>(
        () => _i717.GetMostsellingProductsUsecase(gh<_i399.ProductsRepo>()));
    gh.factory<_i590.GetProductsOnBrandsUsecase>(
        () => _i590.GetProductsOnBrandsUsecase(gh<_i399.ProductsRepo>()));
    gh.factory<_i810.GetProductsOnCategoryUsecase>(
        () => _i810.GetProductsOnCategoryUsecase(gh<_i399.ProductsRepo>()));
    gh.factory<_i406.GetProductsOnSubCategoryUsecase>(
        () => _i406.GetProductsOnSubCategoryUsecase(gh<_i399.ProductsRepo>()));
    gh.factory<_i422.GetCatogriesUSeCase>(
        () => _i422.GetCatogriesUSeCase(gh<_i37.Catogriesrepo>()));
    gh.factory<_i63.FavoritesRepo>(
        () => _i885.FavoritesRepoImpl(gh<_i146.FavoritesDataSource>()));
    gh.factory<_i399.AddRemoveProductToFavoritsUseCase>(() =>
        _i399.AddRemoveProductToFavoritsUseCase(gh<_i63.FavoritesRepo>()));
    gh.factory<_i558.GetFavoritesUseCase>(
        () => _i558.GetFavoritesUseCase(gh<_i63.FavoritesRepo>()));
    gh.factory<_i532.RemoveProductToFavoritsUseCase>(
        () => _i532.RemoveProductToFavoritsUseCase(gh<_i63.FavoritesRepo>()));
    gh.factory<_i111.SignInUsecase>(
        () => _i111.SignInUsecase(gh<_i92.AuthRepo>()));
    gh.factory<_i359.SignupUsecase>(
        () => _i359.SignupUsecase(gh<_i92.AuthRepo>()));
    gh.factory<_i836.HomeScreenViewModel>(
        () => _i836.HomeScreenViewModel(gh<_i390.GetCartUsecase>()));
    gh.factory<_i301.GetBrandsUseCase>(
        () => _i301.GetBrandsUseCase(gh<_i627.BrandsRepo>()));
    gh.factory<_i468.GetSubcatogriesOnCategoryUsecase>(() =>
        _i468.GetSubcatogriesOnCategoryUsecase(gh<_i459.SubcatogriesRepo>()));
    gh.factory<_i965.FavoritesViewmodel>(() => _i965.FavoritesViewmodel(
          gh<_i558.GetFavoritesUseCase>(),
          gh<_i172.AddProductToCartUseCase>(),
          gh<_i399.AddRemoveProductToFavoritsUseCase>(),
        ));
    gh.factory<_i881.GetAuthTokenUseCase>(
        () => _i881.GetAuthTokenUseCase(gh<_i1050.PaymentRepo>()));
    gh.factory<_i665.GetOrderIdUseCase>(
        () => _i665.GetOrderIdUseCase(gh<_i1050.PaymentRepo>()));
    gh.factory<_i315.GetPaymentKeyUseCase>(
        () => _i315.GetPaymentKeyUseCase(gh<_i1050.PaymentRepo>()));
    gh.factory<_i1018.SignUpViewModel>(
        () => _i1018.SignUpViewModel(gh<_i359.SignupUsecase>()));
    gh.factory<_i906.HomeTabViewModel>(() => _i906.HomeTabViewModel(
          gh<_i422.GetCatogriesUSeCase>(),
          gh<_i301.GetBrandsUseCase>(),
          gh<_i717.GetMostsellingProductsUsecase>(),
        ));
    gh.factory<_i871.ProductViewModel>(() => _i871.ProductViewModel(
          gh<_i406.GetProductsOnSubCategoryUsecase>(),
          gh<_i810.GetProductsOnCategoryUsecase>(),
          gh<_i590.GetProductsOnBrandsUsecase>(),
          gh<_i886.GetproductsForSearch>(),
          gh<_i172.AddProductToCartUseCase>(),
          gh<_i399.AddRemoveProductToFavoritsUseCase>(),
          gh<_i708.RemoveCartProductUseCase>(),
        ));
    gh.factory<_i144.SignInViewModel>(
        () => _i144.SignInViewModel(gh<_i111.SignInUsecase>()));
    gh.factory<_i245.CatogriesTabViewModel>(() => _i245.CatogriesTabViewModel(
          gh<_i422.GetCatogriesUSeCase>(),
          gh<_i468.GetSubcatogriesOnCategoryUsecase>(),
        ));
    gh.factory<_i582.PaymentViewmodel>(() => _i582.PaymentViewmodel(
          gh<_i881.GetAuthTokenUseCase>(),
          gh<_i665.GetOrderIdUseCase>(),
          gh<_i315.GetPaymentKeyUseCase>(),
          gh<_i461.ClearCartUseCase>(),
        ));
    return this;
  }
}
