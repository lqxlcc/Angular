import {RouterModule,Routes} from '@angular/router';

//龙飞宇
import {ListComponent} from '../components/list/list.component';
import {PagenotfoundComponent} from "../components/pagenotfound/pagenotfound.component";
import { ProductComponent } from '../components/product/product.component';
import {MerchandiseComponent} from '../components/merchandise/merchandise.component';
import {DetailsComponent} from '../components/details/details.component';
import {EstimateComponent} from '../components/estimate/estimate.component';

const appRoutes: Routes = [

    {path:'list',component: ListComponent},
    {path:'product',component: ProductComponent,
        children: [
            {path: 'merchandise', component: MerchandiseComponent},
            {path: 'details', component: DetailsComponent},
            {path: 'estimate', component: EstimateComponent}
        ]
    },
    {path:'**',component:PagenotfoundComponent},
   
]

export const RootRouter = RouterModule.forRoot(
    appRoutes,
    {enableTracing:false}
)