import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {FormsModule} from '@angular/forms';
import {HttpModule} from '@angular/http';
import {RootRouter} from './router/router'

import {RangePipe} from './utils/range.pipe'
import {HttpService} from './utils/http.service';

import { ElModule } from 'element-angular'
import { BrowserAnimationsModule } from '@angular/platform-browser/animations'

import { AppComponent } from './app.component';
import { HomeComponent } from './components/home/home.component';
import { ListComponent } from './components/list/list.component';
import { PagenotfoundComponent } from './components/pagenotfound/pagenotfound.component';
import { CartComponent } from './components/cart/cart.component';
import { CategoryComponent } from './components/category/category.component';
import { MineComponent } from './components/mine/mine.component';
import { ListdatagridComponent } from './components/listdatagrid/listdatagrid.component';
import { ProductComponent } from './components/product/product.component';


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
    ListdatagridComponent,
    ProductComponent,
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    RootRouter,
    ElModule.forRoot(),
  ],
  providers: [HttpService],
  bootstrap: [ProductComponent]
})
export class AppModule { }