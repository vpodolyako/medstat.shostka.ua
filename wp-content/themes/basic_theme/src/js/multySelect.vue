<template>
    <div class="label-select multyselect" @click="addSelect" v-click-outside="removeSelect" :class="{'open':open}">
        <!-- label select -->
        <span class="label-info">{{ config.name }}</span>
        <div class="select">
            <div class="select-inner" :class="{ 'active': open }">
                <!-- getnerate list active selected -->
                <div v-if="selectedItems.length > 0" class="multyselect-list-block">
                    <ul class="selected-elements" :class="{'one-style' : !config.multy}">
                        <li 
                            v-for="(el, index) in selectedItems"
                            :key="el.id"
                            @click="removeFromSelectd(index)"
                        >
                            <span class="text">{{ el.text }}</span>
                            <span class="icon-wrap">
                                <svg class="icon">
                                    <use :xlink:href="template+'/img/icons/svgmap.svg#close'" />
                                </svg>
                            </span>
                        </li>
                    </ul>
                </div>
                <div v-if="selectedItems.length == 0" class="select-placeholder">{{ config.default }}</div>
                <input  autocomplete="off"
                        type="text"
                        class="input-text search"
                        @keyup="searchBy"
                        ref="search"
                        v-model="search"
                        v-if="config.search"
                        @click.self="addSelect"
                    />
            </div>
            <!-- drop down area -->
            <div class="selected-block" :class="{ 'hidden-list': !open }">
                <!-- actual veraible list -->
                <ul class="select-list">
                    <li
                        v-for="item in actualData"
                        :key="item.id"
                        @click="select(item)"
                        :class="{'selected' : selectedIds.includes(item.id)}"
                    >{{ item.text }}</li>
                </ul>
            </div>
        </div>
    </div>
</template>
<script>
import Vue from 'vue'
import vClickOutside from 'v-click-outside'

Vue.use(vClickOutside)

export default {
    data() {
        return {
            template: window.api_settings.template,
            //open list && seatch
            open: false,
            //search word
            search: "",
            //current selected items
            selectedItems: [],
            //current selected ids
            selectedIds: [],
            //all data to select
            dataList: [],
            //filtered data to select
            actualData: [],
            //config settings
            config: {
                search: false,
                multy: false,
                name: "",
                default: "",
                limitSelect: 10
            }
        };
    },
    props: ["selected", "attribute", "settings", "data"],
    mounted() {
        //get data to select
        if (this.getfrom && this.getData()) {
            activeGetData();
            this.selectedActiveData();
        }
        if (this.data) {
            this.dataList = this.data;
            this.actualData = this.data;
        }
        //set config settings
        this.config = { ...this.config, ...this.settings };
    },
    methods: {
        //selecting active data to selected array
        activeGetData() {
            if (this.selected) {
                if (this.config.multy) {
                    this.selectedItems = this.actualData.filter(li =>
                        this.selected.includes(li.id)
                    );
                } else {
                    this.selectedItems = this.actualData.filter(
                        li => li.id == this.selected
                    );
                }
            }
        },
        //active and show all actual items
        selectedActiveData() {
            if (this.dataList.length > 0 && this.selectedIds.length > 0) {
                this.dataList.forEach(el => {
                    if (this.selectedIds.includes(el.id)) {
                        this.selectedItems.push(el);
                    }
                });
            }
        },
        //active search
        searchBy($event) {
            let val = $event.target.value;
            let search = new RegExp(val.toLowerCase());
            this.actualData = this.dataList.filter(el =>
                search.test(el.text.toLowerCase())
            );
        },
        removeFromSelectd(index) {
            console.log('removeFromSelectd');
            
            if(index == 0){
                this.selectedItems = '';
                this.selectedIds = '';
            }
            else{
                this.selectedItems.splice(index, 1);
                this.selectedIds.splice(index, 1);
            }
        },
        //toggle select
        toogleSelect() {
            this.open = true;
            if (this.open && this.config.search) {
                this.$nextTick(() => this.$refs.search.focus());
            }
        },
        addSelect() {
            this.open = true;
        },
        removeSelect() {
            this.open = false;
        },
        getIdsSelected() {
            this.selectedIds = this.selectedItems.map(el => el.id);
        },
        //selected element
        select(item) {
            if (this.config.multy) {
                let find = this.selectedItems.filter(li => li.id == item.id);
                if (find.length == 1) {
                    this.selectedItems = this.selectedItems.filter(
                        li => li.id != item.id
                    );
                } else {
                    if (this.selectedItems.length < this.config.limitSelect) {
                        this.selectedItems.push(item);
                    }
                }
                this.getIdsSelected();
                this.$emit("change", {
                    value: this.selectedIds,
                    attribute: this.attribute
                });
            } else {
                this.selectedItems = [item];
                this.selectedIds = [item.id];
                this.$emit("change", {
                    value: this.selectedIds[0],
                    attribute: this.attribute
                });
                this.toogleSelect();
            }
        }
    }
};

</script>