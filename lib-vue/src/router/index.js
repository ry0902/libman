import Vue from 'vue'
import VueRouter from 'vue-router'

import Login from '@/components/Login'
import AppIndex from '@/components/home/AppIndex'
import Home from '@/components/Home'
import LibraryIndex from '@/components/library/LibraryIndex'
import BorrowManage from '@/components/borrowManage/BorrowManage'

import test from '@/components/test'

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/home',
    name: 'Home',
    component: Home,
    redirect: '/index',
    children: [
      {
        path: '/index',
        name: 'AppIndex',
        component: AppIndex,
        meta: {
          requireAuth: true
        }
      },
      {
        path: '/library',
        name: 'LibraryIndex',
        component: LibraryIndex,
        meta: {
          requireAuth: true
        }
      },
      {
        path: '/BorrowManage',
        name: 'BorrowManage',
        component: BorrowManage,
        meta: {
          requireAuth: true
        }
      }
    ]
  },
  {
    path: '/test',
    name: 'test',
    component: test
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
