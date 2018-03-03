import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {FormsModule} from '@angular/forms';
import {HttpModule} from '@angular/http';
import {RootRouter} from './router/router'

import {RangePipe} from './utils/range.pipe'

import { AppComponent } from './app.component';
import { HomeComponent } from './components/home/home.component';
import { ListComponent } from './components/list/list.component';
import { PagenotfoundComponent } from './components/pagenotfound/pagenotfound.component';
import { CartComponent } from './components/cart/cart.component';
import { CategoryComponent } from './components/category/category.component';
import { MineComponent } from './components/mine/mine.component';

import { FooterComponent } from './components/footer/footer.component';
import { MyorderComponent } from './components/myorder/myorder.component';
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
    FooterComponent,
    MyorderComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    RootRouter
  ],
  providers: [],
  bootstrap: [HomeComponent]
})
export class AppModule { }
