import {RouterModule,Routes} from '@angular/router';

//龙飞宇
import {ListComponent} from '../components/list/list.component';
import {PagenotfoundComponent} from "../components/pagenotfound/pagenotfound.component";
import { ProductComponent } from '../components/product/product.component'

const appRoutes: Routes = [
    {path:'list',component: ListComponent},
    {path:'product',component: ProductComponent},
    {path:'**',component:PagenotfoundComponent},
   
]

export const RootRouter = RouterModule.forRoot(
    appRoutes,
    {enableTracing:false}
)