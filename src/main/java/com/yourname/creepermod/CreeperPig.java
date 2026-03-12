package com.yourname.creepermod;

import net.minecraftforge.common.MinecraftForge;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.fml.common.Mod.EventHandler;
import net.minecraftforge.fml.common.event.FMLInitializationEvent;
import net.minecraftforge.fml.common.event.FMLPreInitializationEvent;
import net.minecraftforge.fml.common.eventbus.SubscribeEvent;
import net.minecraftforge.event.entity.EntityEvent;
import net.minecraft.entity.EntityLivingBase;
import net.minecraft.entity.ai.EntityAIAttackOnCollide;
import net.minecraft.entity.ai.EntityAILookIdle;
import net.minecraft.entity.ai.EntityAINearestAttackableTarget;
import net.minecraft.entity.ai.EntityAISwimming;
import net.minecraft.entity.ai.EntityAIWander;
import net.minecraft.entity.ai.EntityAIWatchClosest;
import net.minecraft.entity.monster.EntityMob;
import net.minecraft.entity.passive.EntityPig;
import net.minecraft.entity.player.EntityPlayer;

@Mod(modid = CreeperPig.MODID, version = CreeperPig.VERSION)
public class CreeperPig {
    public static final String MODID = "creeperpig";
    public static final String VERSION = "1.0.0";

    @EventHandler
    public void preInit(FMLPreInitializationEvent event) {
        MinecraftForge.EVENT_BUS.register(new PigBehaviorHandler());
    }

    @EventHandler
    public void init(FMLInitializationEvent event) {
        System.out.println("Creeper Pig mod initialized!");
    }

    public static class PigBehaviorHandler {
        @SubscribeEvent
        public void onEntityConstructing(EntityEvent.EntityConstructing event) {
            if (event.entity instanceof EntityPig && !event.entity.worldObj.isRemote) {
                EntityPig pig = (EntityPig) event.entity;
                replacePigAI(pig);
            }
        }

        private void replacePigAI(EntityPig pig) {
            pig.tasks.taskEntries.clear();
            pig.targetTasks.taskEntries.clear();

            pig.tasks.addTask(0, new EntityAISwimming(pig));
            pig.tasks.addTask(1, new EntityAIAttackOnCollide(pig, EntityLivingBase.class, 0.25F, false));
            pig.tasks.addTask(2, new EntityAIWander(pig, 0.2D));
            pig.tasks.addTask(3, new EntityAIWatchClosest(pig, EntityLivingBase.class, 8.0F));
            pig.tasks.addTask(4, new EntityAILookIdle(pig));

            pig.targetTasks.addTask(0, new EntityAINearestAttackableTarget(pig, EntityPlayer.class, 0, true));
            pig.targetTasks.addTask(1, new EntityAINearestAttackableTarget(pig, EntityMob.class, 0, false));
        }
    }
}
