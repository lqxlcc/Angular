import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {FormsModule} from '@angular/forms';
import {HttpModule} from '@angular/http';
import {RootRouter} from './router/router'
import { BrowserAnimationsModule } from '@angular/platform-browser/animations'
import { NgZorroAntdModule } from 'ng-zorro-antd';

import { ElModule } from 'element-angular';

import {RangePipe} from './utils/range.pipe';
import {HttpService} from './utils/http.service';


import { AppComponent } from './app.component';
import { HomeComponent } from './components/home/home.component';
import { ListComponent } from './components/list/list.component';
import { PagenotfoundComponent } from './components/pagenotfound/pagenotfound.component';
import { CartComponent } from './components/cart/cart.component';
import { CategoryComponent } from './components/category/category.component';
import { MineComponent } from './components/mine/mine.component';


import { DataCarouselComponent } from './components/dataCarousel/dataCarousel.component';


import { ProductComponent } from './components/product/product.component';
import { MerchandiseComponent } from './components/merchandise/merchandise.component';
import { DetailsComponent } from './components/details/details.component';
import { EstimateComponent } from './components/estimate/estimate.component';


import { FooterComponent } from './components/footer/footer.component';
import { MyorderComponent } from './components/myorder/myorder.component';
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';
import { PersonalInformationComponent } from './components/personal-information/personal-information.component';
import { AddressMangementComponent } from './components/address-mangement/address-mangement.component';

@NgModule({
  declarations: [
    AppComponent,
    RangePipe,
    HomeComponent,
    ListComponent,
    PagenotfoundComponent,
    CartComponent,
    CategoryComponent,
    MineComponent,
    DataCarouselComponent,
    ProductComponent,
    MerchandiseComponent,
    DetailsComponent,
    EstimateComponent,
    FooterComponent,
    MyorderComponent,
    LoginComponent,
    RegisterComponent,
    PersonalInformationComponent,
    AddressMangementComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    RootRouter,
    ElModule.forRoot(),
    NgZorroAntdModule.forRoot(),
  ],
  providers: [HttpService],
  bootstrap: [AppComponent]

})
export class AppModule { }