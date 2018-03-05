import {RouterModule,Routes} from '@angular/router';

//龙飞宇
import {ListComponent} from '../components/list/list.component';
import {PagenotfoundComponent} from "../components/pagenotfound/pagenotfound.component";
import { ProductComponent } from '../components/product/product.component';
import {MerchandiseComponent} from '../components/merchandise/merchandise.component';
import {DetailsComponent} from '../components/details/details.component';
import {EstimateComponent} from '../components/estimate/estimate.component';

import {CartComponent} from '../components/cart/cart.component';
import {CategoryComponent} from '../components/category/category.component';
import {HomeComponent} from '../components/home/home.component';
import {MineComponent} from '../components/mine/mine.component';
import {MyorderComponent} from '../components/myorder/myorder.component';

import { PersonalInformationComponent } from '../components/personal-information/personal-information.component';
import { LoginComponent } from '../components/login/login.component';
import { AddressMangementComponent } from '../components/address-mangement/address-mangement.component';

const appRoutes: Routes = [
    {path:'',component: HomeComponent},
    {path:'home',component: HomeComponent},
    {path:'list',component: ListComponent},
    {path:'product',component: ProductComponent,
        children: [
            {path: 'merchandise', component: MerchandiseComponent},
            {path: 'details', component: DetailsComponent},
            {path: 'estimate', component: EstimateComponent}
        ]
    },
    {path:'cart',component:CartComponent},
    {path:'category',component:CategoryComponent},

    {path:'mine',component:MineComponent},
    {path:'myorder',component:MyorderComponent},
    {path:'personalInformation',component:PersonalInformationComponent},
    {path:'login',component:LoginComponent},
    {path:'addressM',component:AddressMangementComponent},
    {path:'**',component:PagenotfoundComponent}

]

export const RootRouter = RouterModule.forRoot(
    appRoutes,
    {enableTracing:false}
)