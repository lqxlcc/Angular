import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {FormsModule} from '@angular/forms';
import {HttpModule} from '@angular/http';
import {RootRouter} from './router/router'

import { ElModule } from 'element-angular';

import {RangePipe} from './utils/range.pipe'

import { HttpService } from  './utils/http.service';

import { AppComponent } from './app.component';
import { HomeComponent } from './components/home/home.component';
import { ListComponent } from './components/list/list.component';
import { PagenotfoundComponent } from './components/pagenotfound/pagenotfound.component';
import { CartComponent } from './components/cart/cart.component';
import { CategoryComponent } from './components/category/category.component';
import { MineComponent } from './components/mine/mine.component';
import { DataCarouselComponent } from './components/dataCarousel/dataCarousel.component';


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
    DataCarouselComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    RootRouter,
    ElModule.forRoot()
  ],
  providers: [
    HttpService,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
